//
//  BaselineSurveyViewController.swift
//  motion
//
//  Created by judywu on 3/22/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import UIKit
import ResearchKit
import AudioToolbox

class SystemSound {
    var soundID: SystemSoundID = 0
    
    init?(soundURL: NSURL) {
        if AudioServicesCreateSystemSoundID(soundURL as CFURLRef, &soundID) != noErr {
            return nil
        }
    }
    deinit {
        AudioServicesDisposeSystemSoundID(soundID)
    }
}


class BaselineSurveyViewController: UIViewController, ORKTaskViewControllerDelegate {
    let baselineAlcoholSurveyuuid = NSUUID().UUIDString
    let baselineSVSurveyuuid = NSUUID().UUIDString
    
    let baselineReactionTaskuuid = NSUUID().UUIDString
    let baselineTappingTaskuuid = NSUUID().UUIDString
    let baselineGoTaskuuid = NSUUID().UUIDString
   
    
    @IBOutlet weak var baselineAlcoholSurveyButton: UIButton!
    
    @IBOutlet weak var baselineSVSurveyButton: UIButton!
    
    @IBOutlet weak var baselineReactionTaskButton: UIButton!
    
    @IBOutlet weak var baselineTappingTaskButton: UIButton!
    
    @IBOutlet weak var baselineGoTaskButton: UIButton!
    
    @IBAction func baselineAlcoholSurveyButtonTapped(sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: BaselineAlcoholSurvey, taskRunUUID: NSUUID(UUIDString: baselineAlcoholSurveyuuid))
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func baselineSVSurveyButtonTapped(sender: UIButton) {
    let taskViewController = ORKTaskViewController(task: BaselineSVSurvey, taskRunUUID: NSUUID(UUIDString: baselineSVSurveyuuid))
    taskViewController.delegate = self
    presentViewController(taskViewController, animated: true, completion: nil)
    
    }


    func setUpAppearance() {
        let customizedColor = UIColor(red: 59.0/255.0, green: 147.0/255.0, blue: 144.0/255.0, alpha: 1.0)
        self.baselineAlcoholSurveyButton.backgroundColor = UIColor.clearColor()
        self.baselineAlcoholSurveyButton.layer.cornerRadius = 5
        self.baselineAlcoholSurveyButton.layer.borderWidth = 1
        self.baselineAlcoholSurveyButton.layer.borderColor =
            customizedColor.CGColor
        
        self.baselineSVSurveyButton.backgroundColor = UIColor.clearColor()
        self.baselineSVSurveyButton.layer.cornerRadius = 5
        self.baselineSVSurveyButton.layer.borderWidth = 1
        self.baselineSVSurveyButton.layer.borderColor =
            customizedColor.CGColor

        
        self.baselineReactionTaskButton.backgroundColor = UIColor.clearColor()
        self.baselineReactionTaskButton.layer.cornerRadius = 5
        self.baselineReactionTaskButton.layer.borderWidth = 1
        self.baselineReactionTaskButton.layer.borderColor =
            customizedColor.CGColor
        
        self.baselineTappingTaskButton.backgroundColor = UIColor.clearColor()
        self.baselineTappingTaskButton.layer.cornerRadius = 5
        self.baselineTappingTaskButton.layer.borderWidth = 1
        self.baselineTappingTaskButton.layer.borderColor =
            customizedColor.CGColor
        
        self.baselineGoTaskButton.backgroundColor = UIColor.clearColor()
        self.baselineGoTaskButton.layer.cornerRadius = 5
        self.baselineGoTaskButton.layer.borderWidth = 1
        self.baselineGoTaskButton.layer.borderColor =
            customizedColor.CGColor
        
        self.baselineTappingTaskButton.enabled = false
        self.baselineGoTaskButton.enabled = false
        self.baselineReactionTaskButton.enabled = false
        
    }

    @IBAction func reactionTaskButtonTapped(sender: UIButton) {
        
        let intendedUseDescription = "See how fast you react to the dot"
//        let successSoundURL = NSBundle.mainBundle().URLForResource("tap", withExtension: "aif")!
//        let successSound = SystemSound(soundURL: successSoundURL)!
        
        let reactionTask = ORKOrderedTask.reactionTimeTaskWithIdentifier("BaselineReactionTimeTask", intendedUseDescription: intendedUseDescription, maximumStimulusInterval: 10, minimumStimulusInterval: 4, thresholdAcceleration: 0.5, numberOfAttempts: 3, timeout: 3, successSound: UInt32(kAudioServicesPropertyCompletePlaybackIfAppDies), timeoutSound: 0, failureSound: UInt32(kSystemSoundID_Vibrate), options: [])
        
        let reactionTaskViewController = ORKTaskViewController(task: reactionTask, taskRunUUID: NSUUID(UUIDString: baselineReactionTaskuuid))
        reactionTaskViewController.delegate = self
        presentViewController(reactionTaskViewController, animated: true, completion: nil)
    }
    
    @IBAction func tappingTaskButtonTapped(sender: UIButton) {
        
        let intendedUseDescription = "Finger tapping is a universal way to communicate."
            
        let tappingTask = ORKOrderedTask.twoFingerTappingIntervalTaskWithIdentifier("BaselineTappingIntervalTask", intendedUseDescription: intendedUseDescription, duration: 10, options: ORKPredefinedTaskOption.None)
        
        let tappingTaskViewController = ORKTaskViewController(task: tappingTask, taskRunUUID: NSUUID(UUIDString: baselineTappingTaskuuid))
        tappingTaskViewController.delegate = self
        presentViewController(tappingTaskViewController, animated: true, completion: nil)
    }
    
    @IBAction func goNoGoTaskButtonTapped(sender: UIButton) {
        let intendedUseDescription = "For accessing your gait and balance"
            
        let goNoGoTask = ORKOrderedTask.toneAudiometryTaskWithIdentifier("BaselineGoNoGoTask", intendedUseDescription: intendedUseDescription, speechInstruction: nil, shortSpeechInstruction: nil, toneDuration: 20, options: [])
        let goNoGoTaskViewController = ORKTaskViewController(task: goNoGoTask, taskRunUUID: NSUUID(UUIDString: baselineGoTaskuuid))
        goNoGoTaskViewController.delegate = self
        presentViewController(goNoGoTaskViewController, animated: true, completion: nil)
            
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
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        switch reason {
        case .Completed:
            if taskViewController.taskRunUUID == NSUUID(UUIDString: baselineAlcoholSurveyuuid) {
                dismissViewControllerAnimated(true, completion: nil)
                self.baselineAlcoholSurveyButton.enabled = false
                self.baselineSVSurveyButton.enabled = true
                //                self.baselineReactionTaskButton.enabled = true
                //                self.baselineTappingTaskButton.enabled = true
            } else if taskViewController.taskRunUUID == NSUUID(UUIDString: baselineReactionTaskuuid) {
                dismissViewControllerAnimated(true, completion: nil)
                self.baselineReactionTaskButton.enabled = false
                self.baselineTappingTaskButton.enabled = true
            } else if taskViewController.taskRunUUID == NSUUID(UUIDString: baselineTappingTaskuuid) {
                dismissViewControllerAnimated(true, completion: nil)
                self.baselineTappingTaskButton.enabled = false
                self.baselineGoTaskButton.enabled = true
            } else if taskViewController.taskRunUUID == NSUUID(UUIDString: baselineGoTaskuuid) {
                performSegueWithIdentifier("unwindToStudy", sender: nil)
            }
        case .Discarded, .Failed, .Saved:
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAppearance()
        // Do any additional setup after loading the view.
    }
}

























