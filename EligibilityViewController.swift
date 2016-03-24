//
//  EligibilityViewController.swift
//  motion
//
//  Created by judywu on 3/1/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//
import UIKit
import ResearchKit

class EligibilityViewController: ORKInstructionStepViewController {
    
//    override func goForward() {
//        let consentDocument = ConsentDocument()
//        let consentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDocument)
//        let healthDataStep = HealthDataStep(identifier: "Health")
//        
//        let signature = consentDocument.signatures!.first!
//        let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: signature, inDocument: consentDocument)
//        reviewConsentStep.text = "Review the consent form."
//        reviewConsentStep.reasonForConsent = "Consent to join the CASPIR Alcohol/Marijuana Abuse Research Study."
//        let passcodeStep = ORKPasscodeStep(identifier: "Passcode")
//        passcodeStep.text = "Now you will create a passcode to identify yourself to the app and protect access to information you've entered."
//        
//        let completionStep = ORKCompletionStep(identifier: "CompletionStep")
//        completionStep.title = "Welcome aboard."
//        completionStep.text = "Thank you for joining this study."
//        
//        let orderedTask = ORKOrderedTask(identifier: "Join", steps: [consentStep, reviewConsentStep, healthDataStep, passcodeStep, completionStep])
//        
//        let taskViewController = ORKTaskViewController(task: orderedTask, taskRunUUID: nil)
//        taskViewController.delegate = self
//        presentViewController(taskViewController, animated: true, completion: nil)
//    }

}

//extension EligibilityViewController: ORKTaskViewControllerDelegate {
//    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
//        switch reason {
//        case .Completed:
//            performSegueWithIdentifier("unwindToStudy", sender: nil)
//            
//        case .Discarded, .Failed, .Saved:
//            dismissViewControllerAnimated(true, completion: nil)
//        }
//    }
//}



