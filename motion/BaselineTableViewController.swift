//
//  BaselineTableViewController.swift
//  motion
//
//  Created by Zhaoxin Wu on 4/14/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import UIKit
import ResearchKit
import RealmSwift

class BaselineTableViewController: UITableViewController, ORKTaskViewControllerDelegate {
    /// Properties
    var taskRows : [BaselineTasks] = [] // the surveys and tasks will be shown for baselines 
    var results: ORKResult?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        let prefs = NSUserDefaults.standardUserDefaults()
        let drugType = prefs.stringForKey("drugType")
        
        if drugType == "Smoke/Vape" {
            taskRows = [BaselineTasks.SVSurvey, BaselineTasks.BalloonTask, BaselineTasks.GoNoGoTask]
        } else if drugType == "Alcohol" {
            taskRows = [BaselineTasks.AlcoholSurvey, BaselineTasks.BalloonTask, BaselineTasks.GoNoGoTask]
        } else if drugType == "Both" {
            taskRows = [BaselineTasks.AlcoholSurvey, BaselineTasks.SVSurvey, BaselineTasks.BalloonTask, BaselineTasks.GoNoGoTask]
        }
    }
//     BaselineTasks.AudioTask, BaselineTasks.ReactionTask,
    
    /// For generate all the feedbacks
    func generateFeedbacks() {
        let rows = [Feedbacks.BaselineAlcoholFeedback1, Feedbacks.BaselineAlcoholFeedback2, Feedbacks.BaselineAlcoholFeedback3, Feedbacks.BaselineAlcoholFeedback4, Feedbacks.BaselineSVFeedback1, Feedbacks.BaselineSVFeedback2, Feedbacks.BaselineSVFeedback3, Feedbacks.BaselineSVFeedback4,  Feedbacks.ThirtyAlcoholFeedback1, Feedbacks.ThirtyAlcoholFeedback2, Feedbacks.ThirtySVFeedback1, Feedbacks.ThirtySVFeedback2]
        
        for i in 0..<rows.count {
            let newFeedback = Feedback()
            newFeedback.name = rows[i].name
            newFeedback.content = rows[i].content
            newFeedback.ID = randomID() as String
            newFeedback.creationDate = NSDate()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /// set up the table view and its cells
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskRows.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(BaselineTableViewCell.reuseIdentifier, forIndexPath: indexPath) as? BaselineTableViewCell else {
            fatalError("Unable to dequeue a ProfileStaticTableViewCell")
        }
        
        let taskListRow = taskRows[indexPath.row]
        
        configureCell(cell, withTitleText: "\(taskListRow.title)", withDescription: "\(taskListRow.description)")
        
        return cell
    }
    
    func configureCell(cell: BaselineTableViewCell, withTitleText titleText: String, withDescription descriptionText: String) {
        // Set the default cell content.
        cell.taskTitle.text = titleText
        cell.taskDescription.text = descriptionText
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let taskListRow = taskRows[indexPath.row]
        let task = taskListRow.representedTask
        let taskRunUUID = taskListRow.taskRunUUID
        let taskViewController = ORKTaskViewController(task: task, taskRunUUID: NSUUID(UUIDString: taskRunUUID))
        
        taskViewController.delegate = self
        
        taskViewController.outputDirectory = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
        
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
    /// Function for updating the table view when survery/task is completed
    func reloadTask(taskRunUUID: NSUUID) {
//        if taskRunUUID == NSUUID(UUIDString: TaskRunUUID.BaselineReactionTask.taskRunUUID) {
//            taskRows = taskRows.filter() {$0 != BaselineTasks.ReactionTask}
//            self.tableView.reloadData()
//        } else if taskRunUUID == NSUUID(UUIDString: TaskRunUUID.BaselineAudioTask.taskRunUUID) {
//            taskRows = taskRows.filter() {$0 != BaselineTasks.AudioTask}
//            self.tableView.reloadData()
        if taskRunUUID == NSUUID(UUIDString: TaskRunUUID.BaselineGoNoGoTask.taskRunUUID) {
            taskRows = taskRows.filter() {$0 != BaselineTasks.GoNoGoTask}
            self.tableView.reloadData()
//            self.tableView.deleteRowsAtIndexPaths(<#T##indexPaths: [NSIndexPath]##[NSIndexPath]#>, withRowAnimation: <#T##UITableViewRowAnimation#>)
        } else if taskRunUUID == NSUUID(UUIDString: TaskRunUUID.BaselineBalloonTask.taskRunUUID) {
            taskRows = taskRows.filter() {$0 != BaselineTasks.BalloonTask}
            self.tableView.reloadData()
        } else if taskRunUUID == NSUUID(UUIDString: TaskRunUUID.BaselineAlcoholSurvey.taskRunUUID) {
            taskRows = taskRows.filter() {$0 != BaselineTasks.AlcoholSurvey}
            self.tableView.reloadData()
        } else if taskRunUUID == NSUUID(UUIDString: TaskRunUUID.BaselineSVSurvey.taskRunUUID) {
            taskRows = taskRows.filter() {$0 != BaselineTasks.SVSurvey}
            self.tableView.reloadData()
        }
    }
    
    /// ORKTableViewControllerDelegate function
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        switch reason {
        case .Completed:
            /// When the participant is done with the last task
            if taskRows.count == 1 {
                let prefs = NSUserDefaults.standardUserDefaults()
                if taskViewController.taskRunUUID == NSUUID(UUIDString: TaskRunUUID.BaselineAlcoholSurvey.taskRunUUID) {
                    /// Set up Realm and NSUserDefault
                    let realm = try! Realm()
                    let participantID = prefs.stringForKey("participantID")!
                    let currentParticipant = realm.objects(Participant).filter("ID == '\(participantID)'").first!
                    let newBaselineSurvey = Survey()
                    
                    /// Set up properties
                    newBaselineSurvey.ID = randomID() as String
                    newBaselineSurvey.catergoryType = "Baseline"
                    newBaselineSurvey.name = taskViewController.result.identifier
                    newBaselineSurvey.taskUUID = taskViewController.taskRunUUID.UUIDString
                    newBaselineSurvey.creationDate = NSDate()
                    newBaselineSurvey.owner = currentParticipant
                    newBaselineSurvey.drugType = "Alcohol"
                    newBaselineSurvey.aImportance = taskViewController.result.stepResultForStepIdentifier(String(BaselineSurveyIdentifiers.BSAlcoholImportanceStep))?.resultForIdentifier(String(BaselineSurveyIdentifiers.BSAlcoholImportanceStep))?.valueForKey("answer") as! Int
                    
                    try! realm.write {
                        currentParticipant.surveys.append(newBaselineSurvey)
                        currentParticipant.passcode = String(prefs.stringForKey("passcode")!)
                        print("\(String(prefs.stringForKey("passcode")!))")
                        currentParticipant.startDate = NSDate()
                        realm.add(newBaselineSurvey)
                    }
                }
                else if taskViewController.taskRunUUID == NSUUID(UUIDString:TaskRunUUID.BaselineSVSurvey.taskRunUUID) {
                    /// Set up Realm and NSUserDefault
                    let realm = try! Realm()
                    let participantID = prefs.stringForKey("participantID")!
                    let currentParticipant = realm.objects(Participant).filter("ID == '\(participantID)'").first!
                    let newBaselineSurvey = Survey()
                    
                    /// Set up properties
                    newBaselineSurvey.ID = randomID() as String
                    newBaselineSurvey.catergoryType = "Baseline"
                    newBaselineSurvey.name = taskViewController.result.identifier
                    newBaselineSurvey.taskUUID = taskViewController.taskRunUUID.UUIDString
                    newBaselineSurvey.creationDate = NSDate()
                    newBaselineSurvey.owner = currentParticipant
                    newBaselineSurvey.drugType = "Smoke/Vape"
                    newBaselineSurvey.sImportance = taskViewController.result.stepResultForStepIdentifier(String(BaselineSurveyIdentifiers.BSSVImportanceStep))?.resultForIdentifier(String(BaselineSurveyIdentifiers.BSSVImportanceStep))?.valueForKey("answer") as! Int
                    
                    
                    try! realm.write {
                        currentParticipant.surveys.append(newBaselineSurvey)
                        currentParticipant.passcode = String(prefs.stringForKey("passcode")!)
                        print("\(String(prefs.stringForKey("passcode")!))")
                        currentParticipant.startDate = NSDate()
                        realm.add(newBaselineSurvey)
                    }
                }
                prefs.setObject(NSDate(), forKey: "startDate")
                prefs.setBool(true, forKey: "checkBaselineFeedback")
                
                performSegueWithIdentifier("unwindToStudy", sender: nil)
                /// Add the passcode to the participant so that they can use passcode to log in
                generateFeedbacks()
                
            // otherwise the participant goes on
            } else {
                if taskViewController.taskRunUUID == NSUUID(UUIDString: TaskRunUUID.BaselineAlcoholSurvey.taskRunUUID) {
                    /// Set up Realm and NSUserDefault
                    let prefs = NSUserDefaults.standardUserDefaults()
                    let participantID = prefs.stringForKey("participantID")!
                    let realm = try! Realm()
                    let currentParticipant = realm.objects(Participant).filter("ID == '\(participantID)'").first!
                    let newBaselineSurvey = Survey()
                    
                    /// Set up properties
                    newBaselineSurvey.ID = randomID() as String
                    newBaselineSurvey.catergoryType = "Baseline"
                    newBaselineSurvey.name = taskViewController.result.identifier
                    newBaselineSurvey.taskUUID = taskViewController.taskRunUUID.UUIDString
                    newBaselineSurvey.creationDate = NSDate()
                    newBaselineSurvey.owner = currentParticipant
                    newBaselineSurvey.drugType = "Alcohol"
                    newBaselineSurvey.aImportance = taskViewController.result.stepResultForStepIdentifier(String(BaselineSurveyIdentifiers.BSAlcoholImportanceStep))?.resultForIdentifier(String(BaselineSurveyIdentifiers.BSAlcoholImportanceStep))?.valueForKey("answer") as! Int
                    
                    try! realm.write {
                        currentParticipant.surveys.append(newBaselineSurvey)
                        realm.add(newBaselineSurvey)
                    }
                }
                else if taskViewController.taskRunUUID == NSUUID(UUIDString:TaskRunUUID.BaselineSVSurvey.taskRunUUID) {
                    /// Set up Realm and NSUserDefault
                    let prefs = NSUserDefaults.standardUserDefaults()
                    let participantID = prefs.stringForKey("participantID")!
                    let realm = try! Realm()
                    let currentParticipant = realm.objects(Participant).filter("ID == '\(participantID)'").first!
                    let newBaselineSurvey = Survey()
                    
                    /// Set up properties
                    newBaselineSurvey.ID = randomID() as String
                    newBaselineSurvey.catergoryType = "Baseline"
                    newBaselineSurvey.name = taskViewController.result.identifier
                    newBaselineSurvey.taskUUID = taskViewController.taskRunUUID.UUIDString
                    newBaselineSurvey.creationDate = NSDate()
                    newBaselineSurvey.owner = currentParticipant
                    newBaselineSurvey.drugType = "Smoke/Vape"
                    newBaselineSurvey.sImportance = taskViewController.result.stepResultForStepIdentifier(String(BaselineSurveyIdentifiers.BSSVImportanceStep))?.resultForIdentifier(String(BaselineSurveyIdentifiers.BSSVImportanceStep))?.valueForKey("answer") as! Int
                    try! realm.write {
                        currentParticipant.surveys.append(newBaselineSurvey)
                        realm.add(newBaselineSurvey)
                    }
                    /// update the rows in the table view
                }
                reloadTask(taskViewController.taskRunUUID)
                dismissViewControllerAnimated(true, completion: nil)
                
            }
        case .Discarded, .Failed, .Saved:
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
