//
//  CASActivityViewController.swift
//  motion
//
//  Created by judywu on 3/18/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import UIKit
import ResearchKit

class CASActivityViewController: UIViewController, ORKTaskViewControllerDelegate {
    let morningSurveyuuid = NSUUID().UUIDString
    let morningTappingTaskuuid = NSUUID().UUIDString
    let morningReactionTaskuuid = NSUUID().UUIDString
    let morningGoNoGoTaskuuid = NSUUID().UUIDString
    let yourThoughtuuid = NSUUID().UUIDString
    let situationSurveyuuid = NSUUID().UUIDString

    @IBOutlet weak var morningSurveyButton: UIButton!
    
    @IBOutlet weak var situationTaskButton: UIButton!

    @IBOutlet weak var yourThoughtButton: UIButton!
    
    @IBAction func morningSurveyButtonTapped(sender: UIButton) {
        var steps = [ORKStep]()
        
        // Instruction step
        let instructionStep = ORKInstructionStep(identifier: "IntroStep")
        instructionStep.title = "Knoweledge of the Universe Survey"
        instructionStep.text = "Please answer these 6 questions to the best of your ability. It's okay to skip a question if you don't know the answer."
        
        steps += [instructionStep]
        
        // Quest question using text choice
        let questQuestionStepTitle = "Which of the following is not a planet?"
        let textChoices = [
            ORKTextChoice(text: "Saturn", value: 0),
            ORKTextChoice(text: "Uranus", value: 1),
            ORKTextChoice(text: "Pluto", value: 2),
            ORKTextChoice(text: "Mars", value: 3)
        ]
        let questAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: textChoices)
        let questQuestionStep = ORKQuestionStep(identifier: "TextChoiceQuestionStep", title: questQuestionStepTitle, answer: questAnswerFormat)
        
        steps += [questQuestionStep]
        
        // Name question using text input
        let nameAnswerFormat = ORKTextAnswerFormat(maximumLength: 25)
        nameAnswerFormat.multipleLines = false
        let nameQuestionStepTitle = "What do you think the next comet that's discovered should be named?"
        let nameQuestionStep = ORKQuestionStep(identifier: "NameQuestionStep", title: nameQuestionStepTitle, answer: nameAnswerFormat)
        
        steps += [nameQuestionStep]
        
        let shapeQuestionStepTitle = "Which shape is the closest to the shape of Messier object 101?"
        let shapeTuples = [
            (UIImage(named: "square")!, "Square"),
            (UIImage(named: "pinwheel")!, "Pinwheel"),
            (UIImage(named: "pentagon")!, "Pentagon"),
            (UIImage(named: "circle")!, "Circle")
        ]
        let imageChoices : [ORKImageChoice] = shapeTuples.map {
            return ORKImageChoice(normalImage: $0.0, selectedImage: nil, text: $0.1, value: $0.1)
        }
        let shapeAnswerFormat: ORKImageChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithImageChoices(imageChoices)
        let shapeQuestionStep = ORKQuestionStep(identifier: "ImageChoiceQuestionStep", title: shapeQuestionStepTitle, answer: shapeAnswerFormat)
        
        steps += [shapeQuestionStep]
        
        // Date question
        let today = NSDate()
        let dateAnswerFormat =  ORKAnswerFormat.dateAnswerFormatWithDefaultDate(nil, minimumDate: today, maximumDate: nil, calendar: nil)
        let dateQuestionStepTitle = "When is the next solar eclipse?"
        let dateQuestionStep = ORKQuestionStep(identifier: "DateQuestionStep", title: dateQuestionStepTitle, answer: dateAnswerFormat)
        
        steps += [dateQuestionStep]
        
        // Boolean question
        let booleanAnswerFormat = ORKBooleanAnswerFormat()
        let booleanQuestionStepTitle = "Is Venus larger than Saturn?"
        let booleanQuestionStep = ORKQuestionStep(identifier: "BooleanQuestionStep", title: booleanQuestionStepTitle, answer: booleanAnswerFormat)
        
        steps += [booleanQuestionStep]
        
        // Continuous question
        let continuousAnswerFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(150, minimumValue: 30, defaultValue: 20, step: 10, vertical: false, maximumValueDescription: "Objects", minimumValueDescription: " ")
        let continuousQuestionStepTitle = "How many objects are in Messier's catalog?"
        let continuousQuestionStep = ORKQuestionStep(identifier: "ContinuousQuestionStep", title: continuousQuestionStepTitle, answer: continuousAnswerFormat)
        
        steps += [continuousQuestionStep]
        
        // Summary step
        let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
        summaryStep.title = "Thank you for completing the morning survey."
        summaryStep.text = "An active task will pop out immediately for you to complete."
        
        steps += [summaryStep]
        
        let morningTask = ORKOrderedTask(identifier: "DailyDrinkingSurvey", steps: steps)
        let taskViewController = ORKTaskViewController(task: morningTask, taskRunUUID: NSUUID(UUIDString: morningSurveyuuid))
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    
    }
    
    func presentMorningTaskViewController() {
        var randomNumber = Int(arc4random_uniform(3))
        
        let intendedUseDescription = "Finger tapping is a universal way to communicate."
       
        if randomNumber == 0 {
            let goNoGoTask = ORKOrderedTask.toneAudiometryTaskWithIdentifier("MorningGoNoGoTask", intendedUseDescription: intendedUseDescription, speechInstruction: nil, shortSpeechInstruction: nil, toneDuration: 20, options: [])
            let goNoGoTaskViewController = ORKTaskViewController(task: goNoGoTask, taskRunUUID: NSUUID(UUIDString: morningGoNoGoTaskuuid))
            goNoGoTaskViewController.delegate = self
            presentViewController(goNoGoTaskViewController, animated: true, completion: nil)
        } else if randomNumber == 1 {
            let tappingTask = ORKOrderedTask.twoFingerTappingIntervalTaskWithIdentifier("MorningTappingIntervalTask", intendedUseDescription: intendedUseDescription, duration: 10, options: ORKPredefinedTaskOption.None)
            
            let tappingTaskViewController = ORKTaskViewController(task: tappingTask, taskRunUUID: NSUUID(UUIDString: morningTappingTaskuuid))
            tappingTaskViewController.delegate = self

            presentViewController(tappingTaskViewController, animated: true, completion: nil)
        } else if randomNumber == 2 {
            let reactionTask = ORKOrderedTask.shortWalkTaskWithIdentifier("MorningReactionTask", intendedUseDescription: intendedUseDescription, numberOfStepsPerLeg: 20, restDuration: 20, options: [])
            let reactionTaskViewController = ORKTaskViewController(task: reactionTask, taskRunUUID: NSUUID(UUIDString: morningReactionTaskuuid))
            reactionTaskViewController.delegate = self
            presentViewController(reactionTaskViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func situationTaskButtonTapped(sender: UIButton) {
        let situationQuestionStepTitle = "Which condition are you in now?"
        let situationTextChoices = [
            ORKTextChoice(text: "I am smoking", value: 0),
            ORKTextChoice(text: "I am drinking", value: 1)
        ]
        let situationQuestionAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: situationTextChoices)
        let situationQuestionStep = ORKQuestionStep(identifier: "SituationQuestionStep", title: situationQuestionStepTitle, answer: situationQuestionAnswerFormat)
        
        let situationSummaryStep = ORKCompletionStep(identifier: "SituationSummaryStep")
        situationSummaryStep.title = "Thank you."
        situationSummaryStep.text = "An active task will pop out immediately for you to complete."
        
        let situationTask = ORKOrderedTask(identifier: "SituationTask", steps: [situationQuestionStep, situationSummaryStep])
        let situationTaskViewController = ORKTaskViewController(task: situationTask, taskRunUUID: NSUUID(UUIDString: situationSurveyuuid))
        situationTaskViewController.delegate = self
        presentViewController(situationTaskViewController, animated: true, completion: nil)
    }
    
    @IBAction func moreThoughtsButtonTapped(sender: UIButton) {
        let thoughtAnswerFormat = ORKTextAnswerFormat(maximumLength: 125)
        thoughtAnswerFormat.multipleLines = true
        let thoughtQuestionStepTitle = "How do you feel today?"
        let thoughtQuestionStep = ORKQuestionStep(identifier: "ThoughtQuestionStep", title: thoughtQuestionStepTitle, answer: thoughtAnswerFormat)
        thoughtQuestionStep.optional = false
        let thoughtTask = ORKOrderedTask(identifier: "YourThought", steps: [thoughtQuestionStep])
        
        let taskViewController = ORKTaskViewController(task: thoughtTask, taskRunUUID: NSUUID(UUIDString: yourThoughtuuid))

        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        switch reason {
        case .Completed:
            if taskViewController.taskRunUUID == NSUUID(UUIDString: morningSurveyuuid) || taskViewController.taskRunUUID == NSUUID(UUIDString: situationSurveyuuid) {
                dismissViewControllerAnimated(true, completion: nil)
                presentMorningTaskViewController()
            } else {
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
