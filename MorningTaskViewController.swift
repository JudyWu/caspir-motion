//
//  MorningTaskViewController.swift
//  motion
//
//  Created by Zhaoxin Wu on 4/11/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import UIKit
import ResearchKit

class MorningTaskViewController: UIViewController, ORKTaskViewControllerDelegate{
    let morningAlcoholTaskuuid = NSUUID().UUIDString
    let morningSVTaskuuid = NSUUID().UUIDString
    
    let morningTappingTaskuuid = NSUUID().UUIDString
    let morningReactionTaskuuid = NSUUID().UUIDString
    let morningGoNoGoTaskuuid = NSUUID().UUIDString
    let morningBalloonTaskuuid = NSUUID().UUIDString
    
    
    @IBAction func morningAlcoholSurveyButtonTapped(sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: DailyAlcoholSurvey, taskRunUUID: NSUUID(UUIDString: morningAlcoholTaskuuid))
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func morningSVSurveyButtonTapped(sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: DailySVSurvey, taskRunUUID: NSUUID(UUIDString: morningSVTaskuuid))
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
    
    func presentMorningTaskViewController() {
        var randomNumber = Int(arc4random_uniform(3))
        
        let intendedUseDescription = "Finger tapping is a universal way to communicate."
        
        if randomNumber == 0 {
            let goNoGoTask = ORKOrderedTask.toneAudiometryTaskWithIdentifier("MorningGoNoGoTask", intendedUseDescription: intendedUseDescription, speechInstruction: nil, shortSpeechInstruction: nil, toneDuration: 20, options: [])
            let goNoGoTaskViewController = ORKTaskViewController(task: goNoGoTask, taskRunUUID: NSUUID(UUIDString: morningGoNoGoTaskuuid))
            goNoGoTaskViewController.delegate = self
            presentViewController(goNoGoTaskViewController, animated: true, completion: nil)
        } else if randomNumber == 1 {
            let tappingTask = ORKOrderedTask.twoFingerTappingIntervalTaskWithIdentifier("MorningTappingIntervalTask", intendedUseDescription: intendedUseDescription, duration: 10, options: ORKPredefinedTaskOption.None)
            
            let tappingTaskViewController = ORKTaskViewController(task: tappingTask, taskRunUUID: NSUUID(UUIDString: morningTappingTaskuuid))
            tappingTaskViewController.delegate = self
            
            presentViewController(tappingTaskViewController, animated: true, completion: nil)
        } else if randomNumber == 2 {
            let reactionTask = ORKOrderedTask.shortWalkTaskWithIdentifier("MorningReactionTask", intendedUseDescription: intendedUseDescription, numberOfStepsPerLeg: 20, restDuration: 20, options: [])
            let reactionTaskViewController = ORKTaskViewController(task: reactionTask, taskRunUUID: NSUUID(UUIDString: morningReactionTaskuuid))
            reactionTaskViewController.delegate = self
            presentViewController(reactionTaskViewController, animated: true, completion: nil)
        }
    }
    
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        switch reason {
        case .Completed:
            if taskViewController.taskRunUUID == NSUUID(UUIDString: morningAlcoholTaskuuid) || taskViewController.taskRunUUID == NSUUID(UUIDString: morningSVTaskuuid) {
                dismissViewControllerAnimated(true, completion: nil)
                presentMorningTaskViewController()
            } else {
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


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
