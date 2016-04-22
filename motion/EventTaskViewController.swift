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
//     @IBAction func eventAlcoholSurveyButtonTapped(sender: UIButton) {
//        let taskViewController = ORKTaskViewController(task: EventAlcoholTask, taskRunUUID: NSUUID(UUIDString: eventAlcoholTaskuuid))
//        taskViewController.delegate = self
//        presentViewController(taskViewController, animated: true, completion: nil)
//    }
//    @IBAction func eventSVSurveyButtonTapped(sender: UIButton) {
//        let taskViewController = ORKTaskViewController(task: EventSVTask, taskRunUUID: NSUUID(UUIDString: eventSVTaskuuid))
//        taskViewController.delegate = self
//        presentViewController(taskViewController, animated: true, completion: nil)
//    }
//
    
    func presentEventTaskViewController() {
        var randomNumber = Int(arc4random_uniform(3))
        
       
        
        if randomNumber == 0 {
            let goNoGoTask = ORKOrderedTask.toneAudiometryTaskWithIdentifier(String(TaskIdentifiers.EventGoNoGoTask), intendedUseDescription: intendedUseDescription, speechInstruction: nil, shortSpeechInstruction: nil, toneDuration: 20, options: [])
            let goNoGoTaskViewController = ORKTaskViewController(task: goNoGoTask, taskRunUUID: NSUUID(UUIDString: eventGoNoGoTaskuuid))
            goNoGoTaskViewController.delegate = self
            presentViewController(goNoGoTaskViewController, animated: true, completion: nil)
        } else if randomNumber == 1 {
            
            let tappingTaskViewController = ORKTaskViewController(task: tappingTask, taskRunUUID: NSUUID(UUIDString: eventTappingTaskuuid))
            tappingTaskViewController.delegate = self
            
            presentViewController(tappingTaskViewController, animated: true, completion: nil)
        } else if randomNumber == 2 {
            
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
