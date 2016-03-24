//
//  CASMorningSurveyViewController.swift
//  motion
//
//  Created by judywu on 3/21/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//
import UIKit
import ResearchKit

class CASMorningSurveyViewController: UIViewController, ORKTaskViewControllerDelegate {
    
    struct StudyTasks {
        static let gaitAndBalanceTask: ORKOrderedTask = {
            let intendedUseDescription = "For accessing your gait and balance"
            return ORKOrderedTask.shortWalkTaskWithIdentifier("GaitAndBalanceTask", intendedUseDescription: intendedUseDescription, numberOfStepsPerLeg: 10, restDuration: 10, options: ORKPredefinedTaskOption.None)
        }()
        
        static let reactionTimeTask: ORKOrderedTask = {
            let intendedUseDescription = "See how fast you react to the dot"
            //        let successSoundURL = NSBundle.mainBundle().URLForResource("tap", withExtension: "aif")!
            //        let successSound = SystemSound(soundURL: successSoundURL)!
            
            return ORKOrderedTask.reactionTimeTaskWithIdentifier("ReactionTimeTask", intendedUseDescription: intendedUseDescription, maximumStimulusInterval: 10, minimumStimulusInterval: 4, thresholdAcceleration: 0.5, numberOfAttempts: 3, timeout: 3, successSound: UInt32(kSystemSoundID_Vibrate), timeoutSound: 0, failureSound: UInt32(kSystemSoundID_Vibrate), options: [])
        }()
        
        static let tappingIntervalTask: ORKOrderedTask = {
            let intendedUseDescription = "Finger tapping is a universal way to communicate."
            
            return ORKOrderedTask.twoFingerTappingIntervalTaskWithIdentifier("TappingIntervalTask", intendedUseDescription: intendedUseDescription, duration: 10, options: ORKPredefinedTaskOption.None)
        }()
    }
    
    let randomArray = [StudyTasks.gaitAndBalanceTask, StudyTasks.reactionTimeTask, StudyTasks.tappingIntervalTask]
    let randomNumber = Int(arc4random_uniform(3))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
//        switch reason {
//        case .Completed
//            presentViewController(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
//            
//        }
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
