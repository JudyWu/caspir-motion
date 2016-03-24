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


class BaselineSurveyViewController: UIViewController {
    let baselineSurveyuuid = NSUUID().UUIDString
    let baselineReactionTaskuuid = NSUUID().UUIDString
    let baselineTappingTaskuuid = NSUUID().UUIDString
    let baselineGoTaskuuid = NSUUID().UUIDString
   
    
    
    
    @IBOutlet weak var baselineSurveyButton: UIButton!
    
    @IBOutlet weak var baselineReactionTaskButton: UIButton!
    
    @IBOutlet weak var baselineTappingTaskButton: UIButton!
    
    @IBOutlet weak var baselineGoTaskButton: UIButton!
    
    @IBAction func baselineSurveyButtonTapped(sender: UIButton) {
        var steps = [ORKStep]()
        
        let instructionStep = ORKInstructionStep(identifier: "IntroStep")
        instructionStep.title = "Drinking Situation"
        instructionStep.text = "Please answer these 10 questions to the best of your ability and no questions can be skipped."
        
        steps += [instructionStep]
        
        let tdsOneNameAnswerFormat = ORKTextAnswerFormat(maximumLength: 25)
        tdsOneNameAnswerFormat.multipleLines = false
        let tdsOneNameQuestionStepTitle = "Under what situation you most likely to drink?"
        let tdsOneNameQuestionStep = ORKQuestionStep(identifier: "tdsOneNameQuestionStep", title: tdsOneNameQuestionStepTitle, answer: tdsOneNameAnswerFormat)
        
        steps += [tdsOneNameQuestionStep]
        
        let tdsTwoNameAnswerFormat = ORKTextAnswerFormat(maximumLength: 25)
        tdsTwoNameAnswerFormat.multipleLines = false
        let tdsTwoNameQuestionStepTitle = "Under what situation you second likely to drink?"
        let tdsTwoNameQuestionStep = ORKQuestionStep(identifier: "tdsTwoNameQuestionStep", title: tdsTwoNameQuestionStepTitle, answer: tdsTwoNameAnswerFormat)
        
        steps += [tdsTwoNameQuestionStep]
        
        let tdsThreeNameAnswerFormat = ORKTextAnswerFormat(maximumLength: 25)
        tdsThreeNameAnswerFormat.multipleLines = false
        let tdsThreeNameQuestionStepTitle = "Under what situation you third likely to drink?"
        let tdsThreeNameQuestionStep = ORKQuestionStep(identifier: "tdsThreeNameQuestionStep", title: tdsThreeNameQuestionStepTitle, answer: tdsThreeNameAnswerFormat)
        
        steps += [tdsThreeNameQuestionStep]
        
        let tdsThreeFrequencyStepTitle = "How oftern will you be in that situation?"
        let tdsThreeFrequencyTextChoices = [
            ORKTextChoice(text: "Daily or almost daily", value: 0),
            ORKTextChoice(text: "4-5 times per week", value: 1),
            ORKTextChoice(text: "2-3 times per week", value: 2),
            ORKTextChoice(text: "Once per week", value: 3),
            ORKTextChoice(text: "Less than once per week", value: 4)
        ]
        let tdsThreeFrequencyAnswerFormat: ORKTextChoiceAnswerFormat = ORKTextAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: tdsThreeFrequencyTextChoices)
        let tdsThreeFrequencyStep = ORKQuestionStep(identifier: "tdsThreeFrequencyQuestionStep", title:tdsThreeFrequencyStepTitle, answer: tdsThreeFrequencyAnswerFormat)
        steps += [tdsThreeFrequencyStep]
        
        let tdsThreeTimeStepTitle = "When will that situation be?"
        let tdsThreeTimeTextChoices = [
            ORKTextChoice(text: "Morning", value: 0),
            ORKTextChoice(text: "Afternoon", value: 1),
            ORKTextChoice(text: "Evening", value: 2),
            ORKTextChoice(text: "At bedtime", value: 3)
        ]
        let tdsThreeTimeAnswerFormat: ORKTextChoiceAnswerFormat = ORKTextAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: tdsThreeTimeTextChoices)
        let tdsThreeTimeStep = ORKQuestionStep(identifier: "tdsThreeTimeQuestionStep", title:tdsThreeTimeStepTitle, answer: tdsThreeTimeAnswerFormat)
        steps += [tdsThreeTimeStep]
        
        let tdsThreeDrinkingFrequencyStepTitle = "How oftern did you drink when you are in that situation?"
        let tdsThreeDrinkingFrequencyTextChoices = [
            ORKTextChoice(text: "Always", value: 0),
            ORKTextChoice(text: "Almost always", value: 1),
            ORKTextChoice(text: "Frequently", value: 2),
            ORKTextChoice(text: "Sometimes", value: 3)
        ]
        
        let tdsThreeDrinkingFrequencyAnswerFormat: ORKTextChoiceAnswerFormat = ORKTextAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: tdsThreeDrinkingFrequencyTextChoices)
        let tdsThreeDrinkingFrequencyStep = ORKQuestionStep(identifier: "tdsThreeDrinkingFrequencyQuestionStep", title:tdsThreeDrinkingFrequencyStepTitle, answer: tdsThreeDrinkingFrequencyAnswerFormat)
        steps += [tdsThreeDrinkingFrequencyStep]
        
        let baselineSummaryStep = ORKCompletionStep(identifier: "BaselineSummaryStep")
        baselineSummaryStep.title = "Thank you"
        baselineSummaryStep.text = "We appreciate your time."
        
        steps += [baselineSummaryStep]
        
        let orderedTask = ORKOrderedTask(identifier: "BaselineTDSSurvey", steps: steps)
        let taskViewController = ORKTaskViewController(task: orderedTask, taskRunUUID: NSUUID(UUIDString: baselineSurveyuuid))
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
        
    }
    

    func setUpAppearance() {
        let customizedColor = UIColor(red: 59.0/255.0, green: 147.0/255.0, blue: 144.0/255.0, alpha: 1.0)
        self.baselineSurveyButton.backgroundColor = UIColor.clearColor()
        self.baselineSurveyButton.layer.cornerRadius = 5
        self.baselineSurveyButton.layer.borderWidth = 1
        self.baselineSurveyButton.layer.borderColor =
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAppearance()

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

extension BaselineSurveyViewController: ORKTaskViewControllerDelegate {
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        switch reason {
        case .Completed:
            if taskViewController.taskRunUUID == NSUUID(UUIDString: baselineSurveyuuid) {
                dismissViewControllerAnimated(true, completion: nil)
                self.baselineSurveyButton.enabled = false
                self.baselineReactionTaskButton.enabled = true
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
}



























