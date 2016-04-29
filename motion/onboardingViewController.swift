/*
Copyright (c) 2015, Apple Inc. All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1.  Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2.  Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation and/or
other materials provided with the distribution.

3.  Neither the name of the copyright holder(s) nor the names of any contributors
may be used to endorse or promote products derived from this software without
specific prior written permission. No license is granted to the trademarks of
the copyright holders even if such marks are included in this software.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import UIKit
import ResearchKit
import RealmSwift

class OnboardingViewController: UIViewController {
    /// For Storage check
    var taskResultFinishedCompletionHandler: (ORKResult -> Void)?
    
    @IBOutlet weak var joinButton: UIButton!
    
    /// For already participanting button
    @IBAction func logInButtonTapped(sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: loginTask, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.LogInTask.taskRunUUID))
//        let taskViewController = ORKTaskViewController(task: baselineAlcoholSurvey, taskRunUUID: nil)
        taskViewController.delegate = self
        taskViewController.outputDirectory = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
    
    // For join button
    @IBAction func joinButtonTapped(sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: onboardingTask, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.OnboardingTask.taskRunUUID))
        taskViewController.delegate = self
        taskViewController.outputDirectory = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
        presentViewController(taskViewController, animated: true, completion: nil)
        
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func setUpAppearance() {
        let customizedColor = CustomizedColors.GreenThemeColor.colorCode
        self.joinButton.backgroundColor = UIColor.clearColor()
        self.joinButton.layer.cornerRadius = 5
        self.joinButton.layer.borderWidth = 1
        self.joinButton.layer.borderColor =
            customizedColor.CGColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAppearance()
        
    }
    /// For Generate User ID (7 digits of integer)
    func randomStringWithLength() -> NSString {
        let letters : NSString = "0123456789"
        
        let randomString : NSMutableString = NSMutableString(capacity: 7)
        
        for (var i=0; i < 7; i++) {
            let length = UInt32 (letters.length)
            let rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
        }
        
        return randomString
    }

}
extension OnboardingViewController : ORKTaskViewControllerDelegate {
    func taskViewController(taskViewController: ORKTaskViewController, viewControllerForStep step: ORKStep) -> ORKStepViewController? {
        if step is HealthDataStep {
            let healthStepViewController = HealthDataStepViewController(step: step)
            return healthStepViewController
        } else if step is ConsentStep {
            let consentStepViewController = ConsentStepViewController(step: step)
            return consentStepViewController
        }
        return nil
    }
    
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        switch reason {
            case .Completed:
                if taskViewController.taskRunUUID == NSUUID(UUIDString: TaskRunUUID.LogInTask.taskRunUUID)   {
                    ///Get the passcode in the login task and save it in userDefaults
                    let passcode = taskViewController.result.stepResultForStepIdentifier(String(OtherTasksIdentifiers.LogInStep))?.resultForIdentifier(String(OtherTasksIdentifiers.LogInItem))?.valueForKey("answer") as? String
                    
                    let prefs = NSUserDefaults.standardUserDefaults()
                    prefs.setValue(passcode, forKey: "passcode")
                    
                    performSegueWithIdentifier("unwindToStudy", sender: nil)

                } else if taskViewController.taskRunUUID == NSUUID(UUIDString: TaskRunUUID.OnboardingTask.taskRunUUID) {
                    if taskViewController.result.stepResultForStepIdentifier(String(OnboardingIdentifiers.IneligibleStep)) != nil {
                        dismissViewControllerAnimated(true, completion: nil)
                    } else {
                        taskResultFinishedCompletionHandler?(taskViewController.result)
                        //// Get the passcode and drugType properties from onboarding task
                        let realm = try! Realm()
                        let drugType = taskViewController.result.stepResultForStepIdentifier("SubstanceTypeStep")?.resultForIdentifier("SubstanceTypeStep")?.valueForKey("answer")?.firstObject as? String
                        let passcode = taskViewController.result.stepResultForStepIdentifier("CodeStep")?.resultForIdentifier("LogInItem")?.valueForKey("answer") as? String
                        
                    
                        //// Create the participant
                        let participantID = randomStringWithLength() as String!
                        
                        /// Create participant when participant completes
                        let currentParticipant = Participant()
                        currentParticipant.ID = participantID
                        currentParticipant.drugType = drugType!
                        currentParticipant.creationDate = NSDate()
                        currentParticipant.passcode = passcode!
                        
                        ///create onboarding for the onboarding information
                        let onboarding = ConsentForm()
                        onboarding.name = taskViewController.result.identifier
                        onboarding.ID = randomID() as String
                        onboarding.creationDate = NSDate()
                        onboarding.owner = currentParticipant
                        onboarding.drugType = drugType!
                        currentParticipant.consentForm = onboarding
                        
                        if drugType == "Smoke/Vape" {
                            onboarding.smokeDay = (taskViewController.result.stepResultForStepIdentifier(String(OnboardingIdentifiers.EligibilityFormStepTwo))?.resultForIdentifier(String(OnboardingIdentifiers.EligibilityFormQuestion4))?.valueForKey("answer") as? Int)!
                        } else if drugType == "Alcohol" {
                            onboarding.heavyDrinkingDay = (taskViewController.result.stepResultForStepIdentifier(String(OnboardingIdentifiers.EligibilityFormStepOne))?.resultForIdentifier(String(OnboardingIdentifiers.EligibilityFormQuestion3))?.valueForKey("answer") as? Int)!
                        } else {
                            onboarding.smokeDay = (taskViewController.result.stepResultForStepIdentifier(String(OnboardingIdentifiers.EligibilityFormStepThree))?.resultForIdentifier(String(OnboardingIdentifiers.EligibilityFormQuestion4))?.valueForKey("answer") as? Int)!
                            onboarding.heavyDrinkingDay = (taskViewController.result.stepResultForStepIdentifier(String(OnboardingIdentifiers.EligibilityFormStepThree))?.resultForIdentifier(String(OnboardingIdentifiers.EligibilityFormQuestion3))?.valueForKey("answer") as? Int)!
                        }
        
                        try! realm.write {
                            realm.add(currentParticipant)
                            realm.add(onboarding)
                        }
                        
                        let prefs = NSUserDefaults.standardUserDefaults()
                        prefs.setObject(drugType, forKey: "drugType")
                        prefs.setObject(passcode, forKey: "passcode")
                        prefs.setObject(participantID, forKey: "participantID")
                    
                        
                        /// Direct to baseline measurements
                        performSegueWithIdentifier("unwindToBaseline", sender: nil)
                        /// Get the path to realm database
                        print(Realm.Configuration.defaultConfiguration.path!)
                    }
                }else{
                    dismissViewControllerAnimated(true, completion: nil)
            }

            case .Discarded, .Failed, .Saved:
                dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    
    func taskViewController(taskViewController: ORKTaskViewController, stepViewControllerWillAppear stepViewController: ORKStepViewController) {
       if stepViewController.step?.identifier == String(OtherTasksIdentifiers.WaitStep) {
            delay(3.0, closure: { () -> () in
                if let stepViewController = stepViewController as? ORKWaitStepViewController {
                    let loginPasscode : String = taskViewController.result.stepResultForStepIdentifier("LogInStep")?.resultForIdentifier("LogInItem")?.valueForKey("answer") as! String
                    
                    let realm = try! Realm()
                    let potentialParticipant = realm.objects(Participant).filter("passcode = '\(loginPasscode)'")
                    if (potentialParticipant.first != nil) {
                        let currentParticipant = potentialParticipant.first!
                        let participantID = currentParticipant.ID
                        let drugType = currentParticipant.drugType
                        let startDate = currentParticipant.startDate
                        
                        let prefs = NSUserDefaults.standardUserDefaults()
                        prefs.setObject(loginPasscode, forKey: "passcode")
                        prefs.setObject(participantID, forKey: "participantID")
                        prefs.setObject(drugType, forKey: "drugType")
                        prefs.setObject(startDate, forKey: "startDate")
                        stepViewController.goForward()
                    } else {
                        stepViewController.goBackward()
                        
                    }
                }
            })
        }
    }
}