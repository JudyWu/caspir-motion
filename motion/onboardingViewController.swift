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

class OnboardingViewController: UIViewController{
   
    let logInuuid = NSUUID().UUIDString
    let onBoardinguuid = NSUUID().UUIDString
    
    
    @IBOutlet weak var joinButton: UIButton!
    
    @IBAction func logInButtonTapped(sender: UIButton) {
        class LoginViewController : ORKLoginStepViewController {
            //The resetPassword Controller pops out
            override func forgotPasswordButtonTapped() {
                let resetPassword = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("resetYourPassword")
                var navigationController = UINavigationController(rootViewController: resetPassword)
                self.presentViewController(navigationController, animated: true, completion: nil)
            }
        }
        // Create a tack for login process
        let loginTitle = NSLocalizedString("Login", comment: "")
        let loginText = "Please enter your email address and password when you registered with this app."
        let loginStep = ORKLoginStep(identifier: "LoginStep", title: loginTitle, text: loginText, loginViewControllerClass: LoginViewController.self)
        
        let waitTitle = NSLocalizedString("Logging in", comment: "")
        let waitText = NSLocalizedString("Please wait while we validate your credentials", comment: "")
        let waitStep = ORKWaitStep(identifier: "LoginWaitStep")
        waitStep.title = waitTitle
        waitStep.text = waitText
        
        let logInTask = ORKOrderedTask(identifier: "LogIn", steps: [loginStep, waitStep])
        
        let taskViewController = ORKTaskViewController(task: logInTask, taskRunUUID: NSUUID(UUIDString: logInuuid))
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
    
    // For join button
    
    @IBAction func joinButtonTapped(sender: UIButton) {
        // For Eligibility
        let eligibilityStep = ORKFormStep(identifier: "EligibilityFormStep")
        eligibilityStep.title = NSLocalizedString("Eligibility", comment: "")
        eligibilityStep.optional = false
        
        let textChoices : [ORKTextChoice] = [ORKTextChoice(text: "Yes", value: "Yes"), ORKTextChoice(text: "No", value: "No")]
        let textAnswerFormat = ORKTextChoiceAnswerFormat(style: ORKChoiceAnswerStyle.SingleChoice, textChoices: textChoices)
        let dayAnswerFormat = ORKNumericAnswerFormat(style: ORKNumericAnswerStyle.Integer, unit: "Days", minimum: 0, maximum: 30)
        
        let drinkAnswerFormat = ORKNumericAnswerFormat(style: ORKNumericAnswerStyle.Integer, unit: "Drinks", minimum: 0, maximum: 15)
        
        let eligibilityQuestion1 = ORKFormItem(identifier: "EligibilityFormQuestion1", text: "DURING THE PAST MONTH, on how many days did you have any beverage containing alcohol (including beer, wine, liquor, etc.)?", answerFormat: dayAnswerFormat)
        eligibilityQuestion1.optional = false
        
        let eligibilityQuestion2 = ORKFormItem(identifier: "EligibilityFormQuestion2", text: "On days when you did drink alcohol DURING THE PAST MONTH, how many drinks did you usually have? Click here for what is considered one drink.", answerFormat: drinkAnswerFormat)
        eligibilityQuestion2.optional = false
        
        let eligibilityQuestion3 = ORKFormItem(identifier: "EligibilityFormQuestion3", text: "DURING THE PAST MONTH, on how many days did you have five (5) or more alcoholic drinks?", answerFormat: dayAnswerFormat)
        eligibilityQuestion3.optional = false
        
        let eligibilityQuestion4 = ORKFormItem(identifier: "EligibilityFormQuestion4", text: "DURING THE PAST MONTH, on how many days did you have any substance containing any marijuana or cannabis substance (e.g. THC vape, edible)?", answerFormat: dayAnswerFormat)
        eligibilityQuestion4.optional = false
        
        let eligibilityQuestion5 = ORKFormItem(identifier: "EligibilityFormQuestion5", text: "Do you have withdrawal symptoms like shaking, sweating, and/or hallucinations when you stop drinking or using for AT LEAST 24 HOURS?", answerFormat: textAnswerFormat)
        eligibilityQuestion5.optional = false
        
        let eligibilityQuestion6 = ORKFormItem(identifier: "EligibilityFormQuestion6", text: "Will you be able to do survey everyday?", answerFormat: textAnswerFormat)
        eligibilityQuestion6.optional = false
        
        let eligibilityQuestion7 = ORKFormItem(identifier: "EligibilityFormQuestion7", text: "Are you comfortable doing tasks on the phone? ", answerFormat: textAnswerFormat)
        eligibilityQuestion7.optional = false
        
        let eligibilityQuestion8 = ORKFormItem(identifier: "EligibilityFormQuestion8", text: "Are you comfortable getting reminders 1-2 times a day for the next 30 days. It will say, 'Please complete the IS survey. Thanks.'", answerFormat: textAnswerFormat)
        eligibilityQuestion8.optional = false
    
        
        eligibilityStep.formItems = [
            eligibilityQuestion1,
            eligibilityQuestion2,
            eligibilityQuestion3,
            eligibilityQuestion4,
            eligibilityQuestion5,
            eligibilityQuestion6,
            eligibilityQuestion7,
            eligibilityQuestion8
        ]
        
        let ineligibleStep = IneligibleStep(identifier: "EligibilityIneligibleStep")
        
        let eligibleStep = ORKInstructionStep(identifier: "EligibilityEligibleStep")
        eligibleStep.text = "Please process to the consent document."
        
        //Build navigation rules for eligible/ineligible pages
        var resultSelector = ORKResultSelector(stepIdentifier: "EligibilityFormStep", resultIdentifier:"EligibilityFormQuestion1")
        
        let predicateFormItem01 = ORKResultPredicate.predicateForNumericQuestionResultWithResultSelector(resultSelector, minimumExpectedAnswerValue: 8.0)
        
        resultSelector = ORKResultSelector(stepIdentifier: "EligibilityFormStep", resultIdentifier: "EligibilityFormQuestion2")
        let predicateFormItem02 = ORKResultPredicate.predicateForNumericQuestionResultWithResultSelector(resultSelector, minimumExpectedAnswerValue: 2.0)
        
        resultSelector = ORKResultSelector(stepIdentifier: "EligibilityFormStep", resultIdentifier: "EligibilityFormQuestion3")
        let predicateFormItem03 = ORKResultPredicate.predicateForNumericQuestionResultWithResultSelector(resultSelector, minimumExpectedAnswerValue: 2.0)
        
        resultSelector = ORKResultSelector(stepIdentifier: "EligibilityFormStep", resultIdentifier: "EligibilityFormQuestion4")
        let predicateFormItem04 = ORKResultPredicate.predicateForNumericQuestionResultWithResultSelector(resultSelector, minimumExpectedAnswerValue: 8.0)
        
        resultSelector = ORKResultSelector(stepIdentifier: "EligibilityFormStep", resultIdentifier: "EligibilityFormQuestion5")
        let predicateFormItem05 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(resultSelector, expectedAnswerValue: "Yes")
        
        resultSelector = ORKResultSelector(stepIdentifier: "EligibilityFormStep", resultIdentifier: "EligibilityFormQuestion6")
        let predicateFormItem06 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(resultSelector, expectedAnswerValue: "Yes")
        
        resultSelector = ORKResultSelector(stepIdentifier: "EligibilityFormStep", resultIdentifier: "EligibilityFormQuestion7")
        let predicateFormItem07 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(resultSelector, expectedAnswerValue: "Yes")
        
        resultSelector = ORKResultSelector(stepIdentifier: "EligibilityFormStep", resultIdentifier: "EligibilityFormQuestion8")
        let predicateFormItem08 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(resultSelector, expectedAnswerValue: "Yes")
        
        
        
        
        let predicateEligible = NSCompoundPredicate(andPredicateWithSubpredicates: [predicateFormItem01, predicateFormItem02, predicateFormItem03, predicateFormItem04, predicateFormItem05, predicateFormItem06, predicateFormItem07, predicateFormItem08])
        
        let predicateRule = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [ (predicateEligible, "EligibilityEligibleStep")])
        
        // Add end direct rules to skip unneeded steps
        let directRule = ORKDirectStepNavigationRule(destinationStepIdentifier: ORKNullStepIdentifier)
        
        
        // Add consent process
        let consentDocument = ConsentDocument()
        let consentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDocument)
        
        // Add registration step
        let registrationTitle = NSLocalizedString("Registration", comment: "")
        let passcodeValidationRegex = "^(?=.*\\d).{4,8}$"
        let passcodeInvalidMessage = NSLocalizedString("A valid password must be 4 and 8 digits long and include at least one numeric character.", comment: "")
//        let registrationOptions: ORKRegistrationStepOption = [.IncludeGivenName, .IncludeFamilyName, .IncludeGender, .IncludeDOB]
        let registrationStep = ORKRegistrationStep(identifier: "RegistrationStep", title: registrationTitle, text: "hahah", passcodeValidationRegex: passcodeValidationRegex, passcodeInvalidMessage: passcodeInvalidMessage, options: ORKRegistrationStepOption.Default)
        
        let waitTitle = NSLocalizedString("Creating account", comment: "")
        let waitText = NSLocalizedString("Please wait while we upload your data", comment: "")
        let waitStep = ORKWaitStep(identifier: "RegistrationWaitStep")
        waitStep.title = waitTitle
        waitStep.text = waitText
        
        //A verification step view controller
        class VerificationViewController : ORKVerificationStepViewController {
            override func resendEmailButtonTapped() {
                let alertTitle = NSLocalizedString("Verification Email has been resent", comment: "")
                let alertMessage = NSLocalizedString("", comment: "")
                let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
        
        let verificationStep = ORKVerificationStep(identifier: "VerificationStep", text: "hkdhs", verificationViewControllerClass: VerificationViewController.self)
        
        // Add authorizationt to HealthKit
        let healthDataStep = HealthDataStep(identifier: "Health")
        
        let signature = consentDocument.signatures!.first!
        let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: signature, inDocument: consentDocument)
        reviewConsentStep.text = "Review the consent form."
        reviewConsentStep.reasonForConsent = "Consent to join the CASPIR Alcohol/Marijuana Abuse Research Study."
        let passcodeStep = ORKPasscodeStep(identifier: "Passcode")
        passcodeStep.text = "Now you will create a passcode to identify yourself to the app and protect access to information you've entered."
        
        let completionStep = ORKCompletionStep(identifier: "CompletionStep")
        completionStep.title = "Welcome aboard."
        completionStep.text = "Thank you for joining this study."
        
        let orderedTask = ORKNavigableOrderedTask(identifier: "Join", steps: [eligibilityStep, ineligibleStep,eligibleStep, consentStep, reviewConsentStep, registrationStep, waitStep, verificationStep, healthDataStep, passcodeStep, completionStep])
        
        orderedTask.setNavigationRule(predicateRule, forTriggerStepIdentifier: "EligibilityFormStep")
        orderedTask.setNavigationRule(directRule, forTriggerStepIdentifier: "EligibilityIneligibleStep")

        
        let taskViewController = ORKTaskViewController(task: orderedTask, taskRunUUID: NSUUID(UUIDString: onBoardinguuid))
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
}
extension OnboardingViewController : ORKTaskViewControllerDelegate {
    func taskViewController(taskViewController: ORKTaskViewController, viewControllerForStep step: ORKStep) -> ORKStepViewController? {
        if step is HealthDataStep {
            let healthStepViewController = HealthDataStepViewController(step: step)
            return healthStepViewController
        } else if step is IneligibleStep {
            let ineligibleStepViewController = IneligibleViewController(step: step)
            return ineligibleStepViewController
        }
        return nil
    }
    
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        switch reason {
            case .Completed:
                if taskViewController.taskRunUUID == NSUUID(UUIDString: logInuuid)   {
                    performSegueWithIdentifier("unwindToStudy", sender: nil)

                } else if taskViewController.taskRunUUID == NSUUID(UUIDString: onBoardinguuid) {
                    performSegueWithIdentifier("unwindToBaseline", sender: nil)
                }
            
            case .Discarded, .Failed, .Saved:
                dismissViewControllerAnimated(true, completion: nil)
        }
    }

    func taskViewController(taskViewController: ORKTaskViewController, stepViewControllerWillAppear stepViewController: ORKStepViewController) {
        if stepViewController is IneligibleViewController {
            func goForward() {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        } else if stepViewController.step?.identifier == "RegistrationWaitStep" || stepViewController.step?.identifier == "LoginWaitStep" {
            delay(3.0, closure: { () -> () in
                if let stepViewController = stepViewController as? ORKWaitStepViewController {
                    stepViewController.goForward()
                }
            })
        } else if stepViewController is ORKVerificationStepViewController {
            delay(1.0, closure: { () -> () in
//                if let stepViewController = stepViewController as? ORKVerificationStepViewController {
                stepViewController.goForward()
//                }
                
            })
        }
        
    }
}
