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
    var taskRows : [BaselineTasks] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
//        var drugType = realm.objects(Participant).filter("ID = '19910815'").first!.drugType
//        print("\(drugType)")
        if drugType == "Smoke/Vape" {
            taskRows = [BaselineTasks.SVSurvey, BaselineTasks.AudioTask, BaselineTasks.ReactionTask, BaselineTasks.BalloonTask, BaselineTasks.GoNoGoTask]
        } else if drugType == "Alcohol" {
            taskRows = [BaselineTasks.AlcoholSurvey, BaselineTasks.AudioTask, BaselineTasks.ReactionTask, BaselineTasks.BalloonTask, BaselineTasks.GoNoGoTask]
        } else if drugType == "Both" {
            taskRows = [BaselineTasks.AlcoholSurvey, BaselineTasks.SVSurvey, BaselineTasks.AudioTask, BaselineTasks.ReactionTask, BaselineTasks.BalloonTask, BaselineTasks.GoNoGoTask]
        }
    
    }
    
    func randomFeedbackID() -> NSString {
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        let randomString : NSMutableString = NSMutableString(capacity: 36)
        
        for (var i=0; i < 36; i++){
            let length = UInt32 (letters.length)
            let rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
        }
        
        return randomString
    }
    
    func generateFeedbacks() {
        for i in 0...Feedbacks.rows.count {
            var newFeedback = Feedback()
            newFeedback.name = Feedbacks.rows[i].name
            newFeedback.content = Feedbacks.rows[i].content
            newFeedback.ID = randomFeedbackID()
            newFeedback.creationDate = NSDate()
        }
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }


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
    
    func reloadTask(taskRunUUID: NSUUID) {
        if taskRunUUID == NSUUID(UUIDString: TaskRunUUID.BaselineReactionTask.taskRunUUID) {
            taskRows = taskRows.filter() {$0 != BaselineTasks.ReactionTask}
            self.tableView.reloadData()
        } else if taskRunUUID == NSUUID(UUIDString: TaskRunUUID.BaselineAudioTask.taskRunUUID) {
            taskRows = taskRows.filter() {$0 != BaselineTasks.AudioTask}
            self.tableView.reloadData()
        } else if taskRunUUID == NSUUID(UUIDString: TaskRunUUID.BaselineGoNoGoTask.taskRunUUID) {
            taskRows = taskRows.filter() {$0 != BaselineTasks.GoNoGoTask}
            self.tableView.reloadData()
        } else if taskRunUUID == NSUUID(UUIDString: TaskRunUUID.BaselineBalloonTask.taskRunUUID) {
            taskRows = taskRows.filter() {$0 != BaselineTasks.BalloonTask}
            self.tableView.reloadData()
        } else if taskRunUUID == NSUUID(UUIDString: TaskRunUUID.BaselineAlcoholSurvey.taskRunUUID) {
            taskRows = taskRows.filter() {$0 != BaselineTasks.AlcoholSurvey}
            self.tableView.reloadData()
        } else if taskRunUUID == NSUUID(UUIDString: TaskRunUUID.BaselineSVSurvey.taskRunUUID){
            taskRows = taskRows.filter() {$0 != BaselineTasks.SVSurvey}
            self.tableView.reloadData()
        }
    }
    
    func configureCell(cell: BaselineTableViewCell, withTitleText titleText: String, withDescription descriptionText: String) {
        // Set the default cell content.
        cell.taskTitle.text = titleText
        cell.taskDescription.text = descriptionText
    }
   
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        switch reason {
        case .Completed:
            /// Store the surveys and tasks data into Realm 
            var newBaselineSurvey = Survey()
//            newBaselineSurvey.ID
//            newBaselineSurvey.drugType
//            newBaselineSurvey.taskRunUUID
//            newBaselineSurvey.catergoryType
            newBaselineSurvey.creationDate = NSDate()
            newBaselineSurvey.name = taskViewController.result.identifier
    
            newBaselineSurvey.owner = currentParticipant
            
            
            var newBaselineTask = Task()
//            newBaselineTask.ID
//            newBaselineTask.drugType
//            newBaselineTask.taskRunUUID
//            newBaselineTask.catergoryType
//            newBaselineTask.taskType

            newBaselineTask.creationDate = NSDate()
            newBaselineTask.name = taskViewController.result.identifier
            
            newBaselineTask.owner = currentParticipant
            if taskRows.count == 1 {
                performSegueWithIdentifier("unwindToStudy", sender: nil)
                /// Add the passcode to the participant 
                currentParticipant?.password = passcode!
                generateFeedbacks()
            } else {
                reloadTask(taskViewController.taskRunUUID)
                dismissViewControllerAnimated(true, completion: nil)
            }
        case .Discarded, .Failed, .Saved:
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
}