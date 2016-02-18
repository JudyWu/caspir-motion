//
//  SurveyTask.swift
//  motion
//
//  Created by judywu on 12/20/15.
//  Copyright © 2015 CASPIR. All rights reserved.
//
import ResearchKit

import Foundation
public var SurveyTask: ORKOrderedTask {
    var steps = [ORKStep]()
    //TODO: add instructions step
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "Drinking Survey"
    instructionStep.text = "We would like to know you daily alcohol consumption."
    steps += [instructionStep]
    
    //TODO: add name question
    let nameAnswerFormat = ORKTextAnswerFormat(maximumLength: 20)
    nameAnswerFormat.multipleLines = false
    let nameQuestionStepTitle = "What is your name?"
    let nameQuestionStep = ORKQuestionStep(identifier: "QuestionStep", title: nameQuestionStepTitle, answer: nameAnswerFormat)
    steps += [nameQuestionStep]

    //TODO: add 'what is your quest' question
    let questQuestionStepTitle = "What is your quest?"
    let textChoices = [
        ORKTextChoice(text: "Create a ResearchKit App", value: 0),
        ORKTextChoice(text: "Look For the lady", value: 1),
        ORKTextChoice(text: "Byebye", value: 2)
    ]
    let questAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: textChoices)
    let questQuestionStep = ORKQuestionStep(identifier: "TextChoiceQuestionStep", title: questQuestionStepTitle, answer: questAnswerFormat)
    steps += [questQuestionStep]

    //TODO: add color question step
    let colorQuestionStepTitle = "What is your favorite color?"
    let colorTuples = [
        (UIImage(named: "yellow")!, "Yellow"),
        (UIImage(named: "red")!, "Red"),
        (UIImage(named: "blue")!, "Blue"),
        (UIImage(named: "purple")!, "Purple"),
        (UIImage(named: "green")!, "Green")
    ]
    let imageChoices: [ORKImageChoice] = colorTuples.map {
        return ORKImageChoice(normalImage: $0.0, selectedImage: nil, text: $0.1, value: $0.1)
    }
    let choiceAnswerFormat: ORKImageChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithImageChoices(imageChoices)
    let colorQuestionStep = ORKQuestionStep(identifier: "ImageChoiceQuestionStep", title: colorQuestionStepTitle, answer: choiceAnswerFormat)
    steps += [colorQuestionStep]
    
    //TODO: add summary step
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Congratulations!"
    summaryStep.text = "Thank you for taking the survey!"
    steps += [summaryStep]
    
    return ORKOrderedTask(identifier: "SurveyTask", steps: steps)

}