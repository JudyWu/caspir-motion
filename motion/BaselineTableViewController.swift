//
//  BaselineTableViewController.swift
//  motion
//
//  Created by Zhaoxin Wu on 4/14/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import UIKit
import ResearchKit

let baselineAlcoholSurveyuuid = NSUUID().UUIDString
let baselineSVSurveyuuid = NSUUID().UUIDString

let baselineReactionTaskuuid = NSUUID().UUIDString
let baselineTappingTaskuuid = NSUUID().UUIDString
let baselineGoNoGoTaskuuid = NSUUID().UUIDString
let baselineBalloonTaskuuid = NSUUID().UUIDString

enum BaselineTasks: Int {

    case TappingTask = 0
    case ReactionTask
    case GoNoGoTask
    case BalloonTask
    
    var title: String {
        switch self {
        case .TappingTask:
            return "Tapping"
        case .ReactionTask:
            return "Reaction Time"
        case .GoNoGoTask:
            return "Implusivity"
        case .BalloonTask:
            return "Risk taking"
        }
    }
    
    var description: String {
        switch self {
        case .TappingTask:
            return "Record your tapping speed"
        case .ReactionTask:
            return "Record your reaction time"
        case .GoNoGoTask:
            return "Record your implusivity"
        case .BalloonTask:
            return "Record your risk taking tendency"
            
        }
    }
    
    var representedTask : ORKTask {
        switch self {
        case .TappingTask:
            return tappingTask
        case .ReactionTask:
            return reactionTask
        case .GoNoGoTask:
            return goNoGoTask
        case .BalloonTask:
            return balloonTask
        }
        
    }
    
    var taskRunUUID: String {
        switch self {
        case .TappingTask:
            return baselineTappingTaskuuid
        case .ReactionTask:
            return baselineReactionTaskuuid
        case .GoNoGoTask:
            return baselineGoNoGoTaskuuid
        case .BalloonTask:
            return baselineBalloonTaskuuid
        }
    }
    
    var tappingTask: ORKTask {
        let intendedUseDescription = "Finger tapping is a universal way to communicate."
        return ORKOrderedTask.twoFingerTappingIntervalTaskWithIdentifier("BaselineTappingIntervalTask", intendedUseDescription: intendedUseDescription, duration: 10, options:ORKPredefinedTaskOption.None)
    }
    
    var reactionTask: ORKTask {
        let intendedUseDescription = "See how fast you react to the dot"
        
        return ORKOrderedTask.reactionTimeTaskWithIdentifier("BaselineReactionTimeTask", intendedUseDescription: intendedUseDescription, maximumStimulusInterval: 10, minimumStimulusInterval: 4, thresholdAcceleration: 0.5, numberOfAttempts: 3, timeout: 3, successSound: UInt32(kAudioServicesPropertyCompletePlaybackIfAppDies), timeoutSound: 0, failureSound: UInt32(kSystemSoundID_Vibrate), options: [])
    }
    
    var goNoGoTask: ORKTask {
        let intendedUseDescription = "For accessing your implusivity"
        return ORKOrderedTask.toneAudiometryTaskWithIdentifier("BaselineGoNoGoTask", intendedUseDescription: intendedUseDescription, speechInstruction: nil, shortSpeechInstruction: nil, toneDuration: 20, options: [])
    }
    
    var balloonTask: ORKTask {
        return ORKOrderedTask.towerOfHanoiTaskWithIdentifier("BaselineBalloonTask", intendedUseDescription: "fjdksfjdskfjs", numberOfDisks: 5, options: [])
    }
}



class BaselineTableViewController: UITableViewController, ORKTaskViewControllerDelegate {

    var taskRows = [BaselineTasks.TappingTask, BaselineTasks.ReactionTask, BaselineTasks.BalloonTask, BaselineTasks.GoNoGoTask]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    
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
        if taskRunUUID == NSUUID(UUIDString: baselineReactionTaskuuid) {
            taskRows = taskRows.filter() {$0 != BaselineTasks.ReactionTask}
            self.tableView.reloadData()
        } else if taskRunUUID == NSUUID(UUIDString: baselineTappingTaskuuid) {
            taskRows = taskRows.filter() {$0 != BaselineTasks.TappingTask}
            self.tableView.reloadData()
        } else if taskRunUUID == NSUUID(UUIDString: baselineGoNoGoTaskuuid) {
            taskRows = taskRows.filter() {$0 != BaselineTasks.GoNoGoTask}
            self.tableView.reloadData()
        } else if taskRunUUID == NSUUID(UUIDString: baselineBalloonTaskuuid) {
            taskRows = taskRows.filter() {$0 != BaselineTasks.BalloonTask}
            self.tableView.reloadData()
        }
    }
    
    func configureCell(cell: BaselineTableViewCell, withTitleText titleText: String, withDescription descriptionText: String) {
        // Set the default cell content.
        cell.taskTitle.text = titleText
        cell.taskDescription.text = descriptionText
    }
//    
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        switch reason {
        case .Completed:
            if taskRows.count == 1 {
                performSegueWithIdentifier("unwindToStudy", sender: nil)
            } else {
                reloadTask(taskViewController.taskRunUUID)
                dismissViewControllerAnimated(true, completion: nil)
            }
        case .Discarded, .Failed, .Saved:
            dismissViewControllerAnimated(true, completion: nil)
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}