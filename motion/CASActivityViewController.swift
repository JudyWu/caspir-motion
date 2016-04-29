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
    /// Properties
    var taskResultFinishedCompletionHandler: (ORKResult -> Void)?

    @IBOutlet weak var morningSurveyButton: UIButton!
    @IBOutlet weak var situationTaskButton: UIButton!
    @IBOutlet weak var yourThoughtButton: UIButton!
    
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
    
    override func viewDidAppear(animated: Bool) {
        let nowDate = NSDate()
        let prefs = NSUserDefaults.standardUserDefaults()
        let startDate = prefs.objectForKey("startDate") as! NSDate
        let timeInterval = nowDate.minutesFrom(startDate)
        let rounds = floor(Double(timeInterval/2))
        
        let checkBaselineFeedback = prefs.boolForKey("checkBaselineFeedback")
        let currentRounds = prefs.doubleForKey("studyRounds")
        if rounds >= 1 && Int(rounds) > Int(currentRounds) {
            alertThirtyDaysFeedbacks()
            prefs.setDouble(rounds, forKey: "studyRounds")
            prefs.setBool(true, forKey: "checkThirtyFeedback")
        } else if checkBaselineFeedback == true {
            alertBaselineFeedback()
            prefs.setDouble(0.0, forKey: "studyRounds")
        }
    }
    
    func alertThirtyDaysFeedbacks() {
        
        let thirtyDayAlertController = UIAlertController(title: "30 days Feedback", message: "Check out your feedback", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) {(action: UIAlertAction) in
            print("You clicked on the cancel button")
        }
        thirtyDayAlertController.addAction(cancelAction)
        let OKAction = UIAlertAction(title: "OK", style: .Default) {(action: UIAlertAction) in
            self.tabBarController!.selectedIndex = 2
        }
        thirtyDayAlertController.addAction(OKAction)
        presentViewController(thirtyDayAlertController, animated: true, completion: nil)
    }
    
    func alertBaselineFeedback() {
        let baselineAlertController = UIAlertController(title: "Baseline Feedback", message: "Check out your feedback", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) {(action: UIAlertAction) in
            print("You clicked on the cancel button")
        }
        baselineAlertController.addAction(cancelAction)
        let OKAction = UIAlertAction(title: "OK", style: .Default) {(action: UIAlertAction) in
            self.tabBarController!.selectedIndex = 2
            let prefs = NSUserDefaults.standardUserDefaults()
            prefs.setBool(false, forKey: "checkBaselineFeedback")
        }
    
        baselineAlertController.addAction(OKAction)
        presentViewController(baselineAlertController, animated: true, completion: nil)
    }
    
    //// Actions
    @IBAction func morningSurveyButtonTapped(sender: UIButton) {
        let prefs = NSUserDefaults.standardUserDefaults()
        let drugType = prefs.stringForKey("drugType")

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
        let prefs = NSUserDefaults.standardUserDefaults()
        let drugType = prefs.stringForKey("drugType")!
        
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
    
    
    /// Customized functions for participants who select drugType as both smoke/vape and alcohol
    func presentMorningTaskViewController() {
        let randomNumber = Int(arc4random_uniform(4))
        
        if randomNumber == 0 {
            let goNoGoTaskViewController = ORKTaskViewController(task: dailyGoNoGoTask, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.DailyGoNoGoTask.taskRunUUID))
            goNoGoTaskViewController.delegate = self
            presentViewController(goNoGoTaskViewController, animated: true, completion: nil)
        } else if randomNumber == 1 {
            let tappingTaskViewController = ORKTaskViewController(task: dailyAudioTask, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.DailyAudioTask.taskRunUUID))
            tappingTaskViewController.delegate = self
            tappingTaskViewController.outputDirectory = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
            presentViewController(tappingTaskViewController, animated: true, completion: nil)
        } else if randomNumber == 2 {
            let reactionTaskViewController = ORKTaskViewController(task: dailyReactionTask, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.DailyReactionTask.taskRunUUID))
            reactionTaskViewController.delegate = self
            reactionTaskViewController.outputDirectory = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
            presentViewController(reactionTaskViewController, animated: true, completion: nil)
        } else {
            let balloonTaskViewController = ORKTaskViewController(task: dailyBalloonTask, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.DailyBalloonTask.taskRunUUID))
            balloonTaskViewController.delegate = self
            presentViewController(balloonTaskViewController, animated: true, completion: nil)
        }
    }
    
    func presentEventTaskViewController() {
        let randomNumber = Int(arc4random_uniform(4))
        
        if randomNumber == 0 {
            let goNoGoTaskViewController = ORKTaskViewController(task: eventGoNoGoTask, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.EventGoNoGoTask.taskRunUUID))
            goNoGoTaskViewController.delegate = self
            presentViewController(goNoGoTaskViewController, animated: true, completion: nil)
        } else if randomNumber == 1 {
            let tappingTaskViewController = ORKTaskViewController(task: eventAudioTask, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.EventAudioTask.taskRunUUID))
            tappingTaskViewController.delegate = self
            tappingTaskViewController.outputDirectory = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
            presentViewController(tappingTaskViewController, animated: true, completion: nil)
        } else if randomNumber == 2 {
            let reactionTaskViewController = ORKTaskViewController(task: eventReactionTask, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.EventReactionTask.taskRunUUID))
            reactionTaskViewController.delegate = self
            reactionTaskViewController.outputDirectory = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
            presentViewController(reactionTaskViewController, animated: true, completion: nil)
        } else {
            let balloonTaskViewController = ORKTaskViewController(task: eventBalloonTask, taskRunUUID: NSUUID(UUIDString: TaskRunUUID.EventBalloonTask.taskRunUUID))
            balloonTaskViewController.delegate = self
            presentViewController(balloonTaskViewController, animated: true, completion: nil)
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
    
    /// ORKTaskViewControllerDelegate
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        switch reason {
        case .Completed:
            if taskViewController.taskRunUUID == NSUUID(UUIDString: TaskRunUUID.DailyAlcoholTask.taskRunUUID) || taskViewController.taskRunUUID == NSUUID(UUIDString: TaskRunUUID.DailySVTask.taskRunUUID) || taskViewController.taskRunUUID == NSUUID(UUIDString: TaskRunUUID.DailySVBothTask.taskRunUUID) {
                
                if taskViewController.result.identifier == String(DailySurveyIdentifiers.DSSVSurvey) {
                    /// Set up Realm and NSUserDefault
                    let prefs = NSUserDefaults.standardUserDefaults()
                    let participantID = prefs.stringForKey("participantID")!
                    let realm = try! Realm()
                    let currentParticipant = realm.objects(Participant).filter("ID == '\(participantID)'").first!
                    let newDailySurvey = Survey()
                    
                    /// Set up properties
                    newDailySurvey.ID = randomID() as String
                    newDailySurvey.name = taskViewController.result.identifier
                    newDailySurvey.taskUUID = taskViewController.taskRunUUID.UUIDString
                    newDailySurvey.creationDate = NSDate()
                    newDailySurvey.drugType = "Smoke/Vape"
                    newDailySurvey.catergoryType = "Daily"
                    newDailySurvey.owner = currentParticipant
                    
                    newDailySurvey.didSmokeDay = taskViewController.result.stepResultForStepIdentifier(String(DailySurveyIdentifiers.DSSVFilterStep))?.resultForIdentifier(String(DailySurveyIdentifiers.DSSVFilterStep))?.valueForKey("answer")?.firstObject as! String
                    
                    newDailySurvey.sIntoxicationAM = taskViewController.result.stepResultForStepIdentifier(String(DailySurveyIdentifiers.DSSVIntoxicationStep))?.resultForIdentifier(String(DailySurveyIdentifiers.DSSVIntoxicationStep))?.valueForKey("answer") as! Int
                    
                    newDailySurvey.sLocation =  taskViewController.result.stepResultForStepIdentifier(String(DailySurveyIdentifiers.DSSVSituationStep))?.resultForIdentifier(String(DailySurveyIdentifiers.DSSVSituationStep))?.valueForKey("answer")?.firstObject as! Int
                    
                    newDailySurvey.sLimitation = taskViewController.result.stepResultForStepIdentifier(String(DailySurveyIdentifiers.DSSVIntentionStep))?.resultForIdentifier(String(DailySurveyIdentifiers.DSSVIntentionStep))?.valueForKey("answer")?.firstObject as! String
                    
                    print("\(taskViewController.result)")
                    try! realm.write {
                        currentParticipant.surveys.append(newDailySurvey)
                        realm.add(newDailySurvey)
                    }

                } else if taskViewController.result.identifier == String(DailySurveyIdentifiers.DSAlcoholSurvey) {
                    /// Set up Realm and NSUserDefault
                    let prefs = NSUserDefaults.standardUserDefaults()
                    let participantID = prefs.stringForKey("participantID")!
                    let realm = try! Realm()
                    let currentParticipant = realm.objects(Participant).filter("ID == '\(participantID)'").first!
                    let newDailySurvey = Survey()
                    
                    /// Set up properties
                    newDailySurvey.ID = randomID() as String
                    newDailySurvey.name = taskViewController.result.identifier
                    newDailySurvey.taskUUID = taskViewController.taskRunUUID.UUIDString
                    newDailySurvey.creationDate = NSDate()
                    newDailySurvey.drugType = "Alcohol"
                    newDailySurvey.catergoryType = "Daily"
                    newDailySurvey.owner = currentParticipant
                    
                    
                    newDailySurvey.totalDrinking = taskViewController.result.stepResultForStepIdentifier(String(DailySurveyIdentifiers.DSAlcoholDrinkStep))?.resultForIdentifier(String(DailySurveyIdentifiers.DSAlcoholDrinkStep))?.valueForKey("answer") as! Int
                    
                    if (newDailySurvey.totalDrinking >= 4) {
                        newDailySurvey.dailyHeavyDrinkingDay = "Yes"
                    } else {
                        newDailySurvey.dailyHeavyDrinkingDay = "No"
                    }
                    newDailySurvey.aLocation = taskViewController.result.stepResultForStepIdentifier(String(DailySurveyIdentifiers.DSAlcoholSituationStep))?.resultForIdentifier(String(DailySurveyIdentifiers.DSAlcoholSituationStep))?.valueForKey("answer") as! Int
                    
                    newDailySurvey.aLimitation = taskViewController.result.stepResultForStepIdentifier(String(DailySurveyIdentifiers.DSAlcoholIntentionStep))?.resultForIdentifier(String(DailySurveyIdentifiers.DSAlcoholIntentionStep))?.valueForKey("answer") as! String
                   
                    
                    try! realm.write {
                        currentParticipant.surveys.append(newDailySurvey)
                        realm.add(newDailySurvey)
                    }

                }
                
                dismissViewControllerAnimated(true, completion: nil)
                presentMorningTaskViewController()
                
            } else if taskViewController.taskRunUUID == NSUUID(UUIDString: TaskRunUUID.DailyAlcoholBothTask.taskRunUUID) {
                dismissViewControllerAnimated(true, completion: nil)
                let realm = try! Realm()
                let prefs = NSUserDefaults.standardUserDefaults()
                let newDailySurvey = Survey()
                let participantID = prefs.stringForKey("participantID")!
                let currentParticipant = realm.objects(Participant).filter("ID == '\(participantID)'").first!
                
                newDailySurvey.ID = randomID() as String
                newDailySurvey.name = taskViewController.result.identifier
                newDailySurvey.taskUUID = taskViewController.taskRunUUID.UUIDString
                newDailySurvey.creationDate = NSDate()
                newDailySurvey.drugType = "Alcohol"
                newDailySurvey.catergoryType = "Daily"
                newDailySurvey.owner = currentParticipant
                
                newDailySurvey.totalDrinking = taskViewController.result.stepResultForStepIdentifier(String(DailySurveyIdentifiers.DSAlcoholDrinkStep))?.resultForIdentifier(String(DailySurveyIdentifiers.DSAlcoholDrinkStep))?.valueForKey("answer")?.firstObject as! Int
                
                if (newDailySurvey.totalDrinking >= 4) {
                    newDailySurvey.dailyHeavyDrinkingDay = "Yes"
                } else {
                    newDailySurvey.dailyHeavyDrinkingDay = "No"
                }
                newDailySurvey.aLocation = taskViewController.result.stepResultForStepIdentifier(String(DailySurveyIdentifiers.DSAlcoholSituationStep))?.resultForIdentifier(String(DailySurveyIdentifiers.DSAlcoholSituationStep))?.valueForKey("answer")?.firstObject as! Int
                
                newDailySurvey.aLimitation = taskViewController.result.stepResultForStepIdentifier(String(DailySurveyIdentifiers.DSAlcoholIntentionStep))?.resultForIdentifier(String(DailySurveyIdentifiers.DSAlcoholIntentionStep))?.valueForKey("answer")?.firstObject as! String
                

                try! realm.write {
                    currentParticipant.surveys.append(newDailySurvey)
                    realm.add(newDailySurvey)
                }

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
}