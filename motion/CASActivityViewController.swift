//
//  CASActivityViewController.swift
//  motion
//
//  Created by judywu on 3/18/16.
//  Copyright © 2016 CASPIR. All rights reserved.

import UIKit
import ResearchKit
import RealmSwift

class CASActivityViewController: UIViewController, ORKTaskViewControllerDelegate {
    
    var taskResultFinishedCompletionHandler: (ORKResult -> Void)?

    @IBOutlet weak var morningSurveyButton: UIButton!
    
    @IBOutlet weak var situationTaskButton: UIButton!

    @IBOutlet weak var yourThoughtButton: UIButton!
    
    @IBAction func morningSurveyButtonTapped(sender: UIButton) {
        if drugType == "Alcohol" {
            let taskViewController = ORKTaskViewController(task: dailyAlcoholSurvey, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.DailyAlcoholTask.taskRunUUID))
                taskViewController.delegate = self
                presentViewController(taskViewController, animated: true, completion: nil)
        } else if drugType == "Smoke/Vape" {
            let taskViewController = ORKTaskViewController(task: dailySVSurvey, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.DailySVTask.taskRunUUID))
                taskViewController.delegate = self
                presentViewController(taskViewController, animated: true, completion: nil)
        } else if drugType == "Both" {
            let taskViewController = ORKTaskViewController(task: dailyAlcoholSurvey, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.DailyAlcoholBothTask.taskRunUUID))
                taskViewController.delegate = self
                presentViewController(taskViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func eventSurveyButtonTapped(sendere: UIButton) {
        if drugType == "Alcohol" {
            let taskViewController = ORKTaskViewController(task: eventAlcoholTask, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.EventAlcoholTask.taskRunUUID))
            taskViewController.delegate = self
            presentViewController(taskViewController, animated: true, completion: nil)
        } else if drugType == "Smoke/Vape" {
            let taskViewController = ORKTaskViewController(task: eventSVTask, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.EventSVTask.taskRunUUID))
            taskViewController.delegate = self
            presentViewController(taskViewController, animated: true, completion: nil)
        } else if drugType == "Both" {
            let taskViewController = ORKTaskViewController(task: eventAlcoholTask, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.EventAlcoholBothTask.taskRunUUID))
            taskViewController.delegate = self
            presentViewController(taskViewController, animated: true, completion: nil)
        }

    }

    @IBAction func moreThoughtsButtonTapped(sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: thoughtTask, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.YourThought.taskRunUUID))
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
    func presentMorningTaskViewController() {
        var randomNumber = Int(arc4random_uniform(3))
        
        let intendedUseDescription = "Finger tapping is a universal way to communicate."
        
        if randomNumber == 0 {
            let goNoGoTaskViewController = ORKTaskViewController(task: dailyGoNoGoTask, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.DailyGoNoGoTask.taskRunUUID))
            goNoGoTaskViewController.delegate = self
            presentViewController(goNoGoTaskViewController, animated: true, completion: nil)
        } else if randomNumber == 1 {
            let tappingTaskViewController = ORKTaskViewController(task: dailyAudioTask, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.DailyAudioTask.taskRunUUID))
            tappingTaskViewController.delegate = self
            
            presentViewController(tappingTaskViewController, animated: true, completion: nil)
        } else if randomNumber == 2 {
            let reactionTaskViewController = ORKTaskViewController(task: dailyReactionTask, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.DailyReactionTask.taskRunUUID))
            reactionTaskViewController.delegate = self
            presentViewController(reactionTaskViewController, animated: true, completion: nil)
        }
    }
    
    func presentEventTaskViewController() {
        var randomNumber = Int(arc4random_uniform(3))
        
        let intendedUseDescription = "Finger tapping is a universal way to communicate."
        
        if randomNumber == 0 {
            let goNoGoTaskViewController = ORKTaskViewController(task: eventGoNoGoTask, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.EventGoNoGoTask.taskRunUUID))
            goNoGoTaskViewController.delegate = self
            presentViewController(goNoGoTaskViewController, animated: true, completion: nil)
        } else if randomNumber == 1 {
            let tappingTaskViewController = ORKTaskViewController(task: eventAudioTask, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.EventAudioTask.taskRunUUID))
            tappingTaskViewController.delegate = self
            
            presentViewController(tappingTaskViewController, animated: true, completion: nil)
        } else if randomNumber == 2 {
            let reactionTaskViewController = ORKTaskViewController(task: eventReactionTask, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.EventReactionTask.taskRunUUID))
            reactionTaskViewController.delegate = self
            presentViewController(reactionTaskViewController, animated: true, completion: nil)
        }
    }
    
    func presentMorningSVBothTaskViewController() {
        let taskViewController = ORKTaskViewController(task: dailySVSurvey, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.DailySVBothTask.taskRunUUID))
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
    func presentEventSVBothTaskViewController() {
        let taskViewController = ORKTaskViewController(task: eventSVTask, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.EventSVBothTask.taskRunUUID))
        
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        switch reason {
        case .Completed:
            /// Store the surveys and tasks data into Realm
            var newDailySurvey = Survey()
            //            newBaselineSurvey.ID
            //            newBaselineSurvey.drugType
            //            newBaselineSurvey.taskRunUUID
            //            newBaselineSurvey.catergoryType
            newDailySurvey.creationDate = NSDate()
            newDailySurvey.name = taskViewController.result.identifier
            
            newBaselineSurvey.owner = currentParticipant
            
            
            var newDailyTask = Task()
            //            newBaselineTask.ID
            //            newBaselineTask.drugType
            //            newBaselineTask.taskRunUUID
            //            newBaselineTask.catergoryType
            //            newBaselineTask.taskType
            
            newDailyTask.creationDate = NSDate()
            newDailyTask.name = taskViewController.result.identifier
            
            newDailyTask.owner = currentParticipant
    
            ////////
            if taskViewController.taskRunUUID == NSUUID(UUIDString: TaskRunUUID.DailyAlcoholTask.taskRunUUID) || taskViewController.taskRunUUID == NSUUID(UUIDString: TaskRunUUID.DailySVTask.taskRunUUID) || taskViewController.taskRunUUID == NSUUID(UUIDString: TaskRunUUID.DailySVBothTask.taskRunUUID) {
                
                dismissViewControllerAnimated(true, completion: nil)
                presentMorningTaskViewController()
                
            } else if taskViewController.taskRunUUID == NSUUID(UUIDString: TaskRunUUID.DailyAlcoholBothTask.taskRunUUID) {
                dismissViewControllerAnimated(true, completion: nil)
                
                presentMorningSVBothTaskViewController()
                presentMorningTaskViewController()
                
            } else if taskViewController.taskRunUUID == NSUUID(UUIDString: TaskRunUUID.EventAlcoholTask.taskRunUUID) || taskViewController.taskRunUUID == NSUUID(UUIDString: TaskRunUUID.EventSVTask.taskRunUUID) || taskViewController.taskRunUUID == NSUUID(UUIDString: TaskRunUUID.EventSVBothTask.taskRunUUID) {
                
                dismissViewControllerAnimated(true, completion: nil)
                presentEventTaskViewController()
                
            } else if taskViewController.taskRunUUID == NSUUID(UUIDString: TaskRunUUID.EventAlcoholBothTask.taskRunUUID) {
                
                dismissViewControllerAnimated(true, completion: nil)
                
                presentEventSVBothTaskViewController()
                presentEventTaskViewController()
                
            }
            else {
                dismissViewControllerAnimated(true, completion: nil)
            }
            
            
        case .Discarded, .Failed, .Saved:
            dismissViewControllerAnimated(true, completion: nil)
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
}
