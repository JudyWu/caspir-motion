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

let realm = try! Realm()

class OnboardingViewController: UIViewController {
    /// For Storage check
    var taskResultFinishedCompletionHandler: (ORKResult -> Void)?
    
    @IBOutlet weak var joinButton: UIButton!
    
    @IBAction func logInButtonTapped(sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: loginTask, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.LogInTask.taskRunUUID))
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
    
    // For join button
    
    @IBAction func joinButtonTapped(sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: onboardingTask, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.OnboardingTask.taskRunUUID))
        taskViewController.delegate = self
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
        let customizedColor = UIColor(red: 59.0/255.0, green: 147.0/255.0, blue: 144.0/255.0, alpha: 1.0)
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
    
    func randomStringWithLength() -> NSString {
        let letters : NSString = "0123456789"
        
        let randomString : NSMutableString = NSMutableString(capacity: 7)
        
        for (var i=0; i < 7; i++){
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
                    passcode = taskViewController.result.stepResultForStepIdentifier("SubstanceTypeStep")?.resultForIdentifier("SubstanceTypeStep")?.valueForKey("answer")?.firstObject as? String
                    
                    performSegueWithIdentifier("unwindToStudy", sender: nil)

                } else if taskViewController.taskRunUUID == NSUUID(UUIDString: TaskRunUUID.OnboardingTask.taskRunUUID) {
                    if taskViewController.result.stepResultForStepIdentifier(String(OnboardingIdentifiers.WrongCodeStep)) != nil || taskViewController.result.stepResultForStepIdentifier(String(OnboardingIdentifiers.IneligibleStep)) != nil {
                        dismissViewControllerAnimated(true, completion: nil)
                    } else {
                        performSegueWithIdentifier("unwindToBaseline", sender: nil)
                        taskResultFinishedCompletionHandler?(taskViewController.result)
                        
                        //// Get the passcode and drugType properties from onboarding task
                        passcode = taskViewController.result.stepResultForStepIdentifier("SubstanceTypeStep")?.resultForIdentifier("SubstanceTypeStep")?.valueForKey("answer")?.firstObject as? String
                        drugType = taskViewController.result.stepResultForStepIdentifier("SubstanceTypeStep")?.resultForIdentifier("SubstanceTypeStep")?.valueForKey("answer")?.firstObject as? String
                        
                        onboarding = ConsentForm()
                        
                        //// Create the participant
                        
                        participantID = randomStringWithLength() as? String
                        startDate = NSDate() as? NSDate
                        
                        /// Create participant when participant completes
                        currentParticipant = Participant()
                        currentParticipant!.ID = participantID!
                        currentParticipant!.drugType = drugType!
                        currentParticipant!.creationDate = startDate!
                        
                        onboarding?.owner = currentParticipant
                        
                        try! realm.write {
                            realm.add(onboarding!)
                            realm.add(currentParticipant!)
                        }
                        
                    }
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
                    if (realm.objects(Participant).filter("ID = '\(loginPasscode)'").first != nil) {
                        stepViewController.goForward()
                    } else {
                        stepViewController.goBackward()
                        
                    }
                }
            })
        }
    }
}


//                        let feedbackTimer = NSTimer(timeInterval: 10, target: FeedbackViewController(), selector: #selector(FeedbackViewController.updateThirtyDayFeedback), userInfo: nil, repeats: true)
//                        NSRunLoop.currentRunLoop().addTimer(feedbackTimer, forMode: NSRunLoopCommonModes)
