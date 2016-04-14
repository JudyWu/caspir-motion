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
    
    /// For Storage check
    var taskResultFinishedCompletionHandler: (ORKResult -> Void)?
    
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
        
        taskViewController.outputDirectory = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
        
        presentViewController(taskViewController, animated: true, completion: nil)

    }
    
    
    // For join button
    
    @IBAction func joinButtonTapped(sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: OnboardingTask, taskRunUUID: NSUUID(UUIDString: onBoardinguuid))
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
                
                taskResultFinishedCompletionHandler?(taskViewController.result)
                print("\(taskViewController.result)")

            
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
