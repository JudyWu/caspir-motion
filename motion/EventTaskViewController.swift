//
//  EventTaskViewController.swift
//  motion
//
//  Created by Zhaoxin Wu on 4/11/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import UIKit
import ResearchKit

class EventTaskViewController: UIViewController, ORKTaskViewControllerDelegate {
    let eventAlcoholTaskuuid = NSUUID().UUIDString
    let eventSVTaskuuid = NSUUID().UUIDString
    
    let eventTappingTaskuuid = NSUUID().UUIDString
    let eventReactionTaskuuid = NSUUID().UUIDString
    let eventGoNoGoTaskuuid = NSUUID().UUIDString
    let eventBalloonTaskuuid = NSUUID().UUIDString
    
    @IBAction func eventAlcoholSurveyButtonTapped(sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: EventAlcoholTask, taskRunUUID: NSUUID(UUIDString: eventAlcoholTaskuuid))
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    @IBAction func eventSVSurveyButtonTapped(sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: EventSVTask, taskRunUUID: NSUUID(UUIDString: eventSVTaskuuid))
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }

    
    func presentEventTaskViewController() {
        var randomNumber = Int(arc4random_uniform(3))
        
        let intendedUseDescription = "Finger tapping is a universal way to communicate."
        
        if randomNumber == 0 {
            let goNoGoTask = ORKOrderedTask.toneAudiometryTaskWithIdentifier("EventGoNoGoTask", intendedUseDescription: intendedUseDescription, speechInstruction: nil, shortSpeechInstruction: nil, toneDuration: 20, options: [])
            let goNoGoTaskViewController = ORKTaskViewController(task: goNoGoTask, taskRunUUID: NSUUID(UUIDString: eventGoNoGoTaskuuid))
            goNoGoTaskViewController.delegate = self
            presentViewController(goNoGoTaskViewController, animated: true, completion: nil)
        } else if randomNumber == 1 {
            let tappingTask = ORKOrderedTask.twoFingerTappingIntervalTaskWithIdentifier("EventTappingIntervalTask", intendedUseDescription: intendedUseDescription, duration: 10, options: ORKPredefinedTaskOption.None)
            
            let tappingTaskViewController = ORKTaskViewController(task: tappingTask, taskRunUUID: NSUUID(UUIDString: eventTappingTaskuuid))
            tappingTaskViewController.delegate = self
            
            presentViewController(tappingTaskViewController, animated: true, completion: nil)
        } else if randomNumber == 2 {
            let reactionTask = ORKOrderedTask.shortWalkTaskWithIdentifier("EventReactionTask", intendedUseDescription: intendedUseDescription, numberOfStepsPerLeg: 20, restDuration: 20, options: [])
            let reactionTaskViewController = ORKTaskViewController(task: reactionTask, taskRunUUID: NSUUID(UUIDString: eventReactionTaskuuid))
            reactionTaskViewController.delegate = self
            presentViewController(reactionTaskViewController, animated: true, completion: nil)
        }
    }
    
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        switch reason {
        case .Completed:
            if taskViewController.taskRunUUID == NSUUID(UUIDString: eventAlcoholTaskuuid) || taskViewController.taskRunUUID == NSUUID(UUIDString: eventSVTaskuuid) {
                dismissViewControllerAnimated(true, completion: nil)
                presentEventTaskViewController()
            } else {
                dismissViewControllerAnimated(true, completion: nil)
            }
        case .Discarded, .Failed, .Saved:
            dismissViewControllerAnimated(true, completion: nil)
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
