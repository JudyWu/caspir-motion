//
//  CASActivityViewController.swift
//  motion
//
//  Created by judywu on 3/18/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import UIKit
import ResearchKit

class CASActivityViewController: UIViewController, ORKTaskViewControllerDelegate {
    
    let morningAlcoholTaskuuid = NSUUID().UUIDString
    let morningAlcoholBothTaskuuid = NSUUID().UUIDString
    let morningSVTaskuuid = NSUUID().UUIDString
    let morningSVBothTaskuuid = NSUUID().UUIDString
    
    
    let morningTappingTaskuuid = NSUUID().UUIDString
    let morningReactionTaskuuid = NSUUID().UUIDString
    let morningGoNoGoTaskuuid = NSUUID().UUIDString
    let morningBalloonTaskuuid = NSUUID().UUIDString
    
    let test_number = 3
    let yourThoughtuuid = NSUUID().UUIDString
    
    var taskResultFinishedCompletionHandler: (ORKResult -> Void)?

    @IBOutlet weak var morningSurveyButton: UIButton!
    
    @IBOutlet weak var situationTaskButton: UIButton!

    @IBOutlet weak var yourThoughtButton: UIButton!
    
    @IBAction func morningSurveyButtonTapped(sender: UIButton) {
        if test_number == 1 {
            let taskViewController = ORKTaskViewController(task: DailyAlcoholSurvey, taskRunUUID: NSUUID(UUIDString: morningAlcoholTaskuuid))
                taskViewController.delegate = self
                presentViewController(taskViewController, animated: true, completion: nil)
        } else if test_number == 2 {
            let taskViewController = ORKTaskViewController(task: DailySVSurvey, taskRunUUID: NSUUID(UUIDString: morningSVTaskuuid))
                taskViewController.delegate = self
                presentViewController(taskViewController, animated: true, completion: nil)
        } else if test_number == 3 {
            let taskViewController = ORKTaskViewController(task: DailyAlcoholSurvey, taskRunUUID: NSUUID(UUIDString: morningAlcoholBothTaskuuid))
                taskViewController.delegate = self
                presentViewController(taskViewController, animated: true, completion: nil)
        }
    }

    @IBAction func moreThoughtsButtonTapped(sender: UIButton) {
        let thoughtAnswerFormat = ORKTextAnswerFormat(maximumLength: 125)
        thoughtAnswerFormat.multipleLines = true
        let thoughtQuestionStepTitle = "How do you feel today?"
        let thoughtQuestionStep = ORKQuestionStep(identifier: "ThoughtQuestionStep", title: thoughtQuestionStepTitle, answer: thoughtAnswerFormat)
        thoughtQuestionStep.optional = false
        let thoughtTask = ORKOrderedTask(identifier: "YourThought", steps: [thoughtQuestionStep])
        
        let taskViewController = ORKTaskViewController(task: thoughtTask, taskRunUUID: NSUUID(UUIDString: yourThoughtuuid))
        
        taskViewController.delegate = self
        taskViewController.outputDirectory = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!

        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    
    
    func presentMorningTaskViewController() {
        var randomNumber = Int(arc4random_uniform(3))
        
        let intendedUseDescription = "Finger tapping is a universal way to communicate."
        
        if randomNumber == 0 {
            let goNoGoTask = ORKOrderedTask.toneAudiometryTaskWithIdentifier(String(TaskIdentifiers.DailyGoNoGoTask), intendedUseDescription: intendedUseDescription, speechInstruction: nil, shortSpeechInstruction: nil, toneDuration: 20, options: [])
            let goNoGoTaskViewController = ORKTaskViewController(task: goNoGoTask, taskRunUUID: NSUUID(UUIDString: morningGoNoGoTaskuuid))
            goNoGoTaskViewController.delegate = self
            presentViewController(goNoGoTaskViewController, animated: true, completion: nil)
        } else if randomNumber == 1 {
            let tappingTask = ORKOrderedTask.twoFingerTappingIntervalTaskWithIdentifier(String(TaskIdentifiers.DailyTappingTask), intendedUseDescription: intendedUseDescription, duration: 10, options: ORKPredefinedTaskOption.None)
            
            let tappingTaskViewController = ORKTaskViewController(task: tappingTask, taskRunUUID: NSUUID(UUIDString: morningTappingTaskuuid))
            tappingTaskViewController.delegate = self
            
            presentViewController(tappingTaskViewController, animated: true, completion: nil)
        } else if randomNumber == 2 {
            let reactionTask = ORKOrderedTask.shortWalkTaskWithIdentifier(String(TaskIdentifiers.DailyReactionTask), intendedUseDescription: intendedUseDescription, numberOfStepsPerLeg: 20, restDuration: 20, options: [])
            let reactionTaskViewController = ORKTaskViewController(task: reactionTask, taskRunUUID: NSUUID(UUIDString: morningReactionTaskuuid))
            reactionTaskViewController.delegate = self
            presentViewController(reactionTaskViewController, animated: true, completion: nil)
        }
    }
    
    func presentMorningSVBothTaskViewController() {
        let taskViewController = ORKTaskViewController(task: DailySVSurvey, taskRunUUID: NSUUID(UUIDString: morningSVBothTaskuuid))
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
    
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        switch reason {
        case .Completed:
            if taskViewController.taskRunUUID == NSUUID(UUIDString: morningAlcoholTaskuuid) || taskViewController.taskRunUUID == NSUUID(UUIDString: morningSVTaskuuid) || taskViewController.taskRunUUID == NSUUID(UUIDString: morningSVBothTaskuuid) {
                dismissViewControllerAnimated(true, completion: nil)
                presentMorningTaskViewController()
            } else if taskViewController.taskRunUUID == NSUUID(UUIDString: morningAlcoholBothTaskuuid) {
                dismissViewControllerAnimated(true, completion: nil)
                presentMorningSVBothTaskViewController()
                presentMorningTaskViewController()
                taskResultFinishedCompletionHandler?(taskViewController.result)
                print("\(taskViewController.result)")
            }
            else {
                dismissViewControllerAnimated(true, completion: nil)
            }
            
            
        case .Discarded, .Failed, .Saved:
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func taskViewController(taskViewController: ORKTaskViewController, viewControllerForStep step: ORKStep) -> ORKStepViewController? {
        if step is IneligibleStep {
            let ineligibleStepViewController = IneligibleViewController(step: step)
            return ineligibleStepViewController
        }
        return nil
    }
    
    
    func taskViewController(taskViewController: ORKTaskViewController, stepViewControllerWillAppear stepViewController: ORKStepViewController) {
        if stepViewController is IneligibleViewController {
            func goForward() {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }
    

    
    
    
    func setUpAppearance() {
        let customizedColor = UIColor(red: 245.0/255.0, green: 102.0/255.0, blue: 79.0/255.0, alpha: 1.0)
        self.morningSurveyButton.backgroundColor = customizedColor
        self.morningSurveyButton.layer.cornerRadius = 10
        self.morningSurveyButton.layer.borderWidth = 1
        self.morningSurveyButton.layer.borderColor =
            customizedColor.CGColor
        
        self.situationTaskButton.backgroundColor = customizedColor
        self.situationTaskButton.layer.cornerRadius = 10
        self.situationTaskButton.layer.borderWidth = 1
        self.situationTaskButton.layer.borderColor =
            customizedColor.CGColor
        
        let themeColor = UIColor(red: 59.0/255.0, green: 147.0/255.0, blue: 144.0/255.0, alpha: 1.0)
        self.yourThoughtButton.backgroundColor = themeColor
        self.yourThoughtButton.layer.cornerRadius = 10
        self.yourThoughtButton.layer.borderWidth = 1
        self.yourThoughtButton.layer.borderColor =
            themeColor.CGColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAppearance()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
