//
//  CASActiveTasks.swift
//  motion
//
//  Created by Zhaoxin Wu on 4/19/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//
import ResearchKit
///// Baseline
var baselineAudioTask: ORKTask {
    let speechInstruction = "Please read the following words out loud in order. Thanks for your time. We appreciate it"
    let shortSpeechInstruction = "shrimp, shoe, light, bed, bread, rabbit, church, judge, spin, refrigerator, leisure, garage, cut, postulate, first, historical, first, tough, this, thin, either, ether, locomotive, hand, mush, lust, stress, bet, tooth, bin, stress, and posturing."
    
    return ORKOrderedTask.audioTaskWithIdentifier(String(TaskIdentifiers.BaselineAudioTask), intendedUseDescription: nil, speechInstruction: speechInstruction, shortSpeechInstruction: shortSpeechInstruction, duration: 15, recordingSettings: nil, options: [])
}

var baselineReactionTask: ORKTask {
    return ORKOrderedTask.reactionTimeTaskWithIdentifier(String(TaskIdentifiers.BaselineReactionTask), intendedUseDescription: nil, maximumStimulusInterval: 10, minimumStimulusInterval: 4, thresholdAcceleration: 0.5, numberOfAttempts: 3, timeout: 3, successSound: UInt32(kAudioServicesPropertyCompletePlaybackIfAppDies), timeoutSound: 0, failureSound: UInt32(kSystemSoundID_Vibrate), options: [])
}

var baselineGoNoGoTask: ORKTask {
    var steps = [ORKStep]()
    
    let title = "Square Task"
    let instructionStepOne = ORKInstructionStep(identifier: "BaselineGoNoGoTaskInstructionOne")
    instructionStepOne.title = title
    instructionStepOne.detailText = "Once you start, you will be presented with a rectangle. Tap the screen when it turns green."
    instructionStepOne.image = UIImage(named: "goNoGoTask_InstructionOne")
    steps += [instructionStepOne]
    
    let goNoGoStep = ORKInstructionStep(identifier: "BaselineGoNoGoTaskStep")
    goNoGoStep.title = title
    goNoGoStep.detailText = "Square task will be demoed in later."
    steps += [goNoGoStep]
    
    
    return ORKOrderedTask(identifier: String(TaskIdentifiers.BaselineGoNoGoTask), steps: steps)
}

var baselineBalloonTask: ORKTask {
    var steps = [ORKStep]()
    
    let title = "Balloon Task"
    let instructionStepOne = ORKInstructionStep(identifier: "BaselineBalloonTaskInstructionOne")
    instructionStepOne.title = title
    instructionStepOne.detailText = "Your goal is to inflat the balloon and each tap for inflating is worth $25. Try to earn as much as you can. You have 15 chances."
    instructionStepOne.image = UIImage(named: "balloonTask_InstructionOne")
    steps += [instructionStepOne]
    
    let balloonStep = ORKInstructionStep(identifier: "BaselineBalloonTaskStep")
    balloonStep.title = title
    balloonStep.detailText = "Balloon task will be demoed in later."
    steps += [balloonStep]
    
    return ORKOrderedTask(identifier:String(TaskIdentifiers.BaselineBalloonTask), steps: steps)
}


//// Daily 

var dailyAudioTask: ORKTask {
    let speechInstruction = "Please read the following words out loud in order. Thanks for your time. We appreciate it"
    let shortSpeechInstruction = "shrimp, shoe, light, bed, bread, rabbit, church, judge, spin, refrigerator, leisure, garage, cut, postulate, first, historical, first, tough, this, thin, either, ether, locomotive, hand, mush, lust, stress, bet, tooth, bin, stress, and posturing."
    return ORKOrderedTask.audioTaskWithIdentifier(String(TaskIdentifiers.DailyAudioTask), intendedUseDescription: nil, speechInstruction: speechInstruction, shortSpeechInstruction: shortSpeechInstruction, duration: 15, recordingSettings: nil, options: [])
}

var dailyGoNoGoTask: ORKTask {
    var steps = [ORKStep]()
    
    let title = "Square Task"
    let instructionStepOne = ORKInstructionStep(identifier: "DailyGoNoGoTaskInstructionOne")
    instructionStepOne.title = title
    instructionStepOne.detailText = "Once you start, you will be presented with a rectangle. Tap the screen when it turns green."
    instructionStepOne.image = UIImage(named: "goNoGoTask_InstructionOne")
    steps += [instructionStepOne]
    
    let goNoGoStep = ORKInstructionStep(identifier: "DailyGoNoGoTaskStep")
    goNoGoStep.title = title
    goNoGoStep.detailText = "Square task will be demoed in later."
    steps += [goNoGoStep]
    
    
    return ORKOrderedTask(identifier: String(TaskIdentifiers.DailyGoNoGoTask), steps: steps)
}

var dailyReactionTask: ORKTask {
    return ORKOrderedTask.reactionTimeTaskWithIdentifier(String(TaskIdentifiers.DailyReactionTask), intendedUseDescription: nil, maximumStimulusInterval: 10, minimumStimulusInterval: 4, thresholdAcceleration: 0.5, numberOfAttempts: 3, timeout: 3, successSound: UInt32(kAudioServicesPropertyCompletePlaybackIfAppDies), timeoutSound: 0, failureSound: UInt32(kSystemSoundID_Vibrate), options: [])

}

var dailyBalloonTask: ORKTask {
    var steps = [ORKStep]()
    
    let title = "Balloon Task"
    let instructionStepOne = ORKInstructionStep(identifier: "DailyBalloonTaskInstructionOne")
    instructionStepOne.title = title
    instructionStepOne.detailText = "Your goal is to inflat the balloon and each tap for inflating is worth $25. Try to earn as much as you can. You have 15 chances."
    instructionStepOne.image = UIImage(named: "balloonTask_InstructionOne")
    steps += [instructionStepOne]
    
    let balloonStep = ORKInstructionStep(identifier: "DailyBalloonTaskStep")
    balloonStep.title = title
    balloonStep.detailText = "Balloon task will be demoed in later."
    steps += [balloonStep]
    
    return ORKOrderedTask(identifier: String(TaskIdentifiers.DailyBalloonTask), steps: steps)
}

////// Event
var eventAudioTask : ORKTask {
    let speechInstruction = "Please read the following words out loud in order. Thanks for your time. We appreciate it"
    let shortSpeechInstruction = "shrimp, shoe, light, bed, bread, rabbit, church, judge, spin, refrigerator, leisure, garage, cut, postulate, first, historical, first, tough, this, thin, either, ether, locomotive, hand, mush, lust, stress, bet, tooth, bin, stress, and posturing."
    
    return ORKOrderedTask.audioTaskWithIdentifier(String(TaskIdentifiers.EventAudioTask), intendedUseDescription: nil, speechInstruction: speechInstruction, shortSpeechInstruction: shortSpeechInstruction, duration: 15, recordingSettings: nil, options: [])
}


var eventReactionTask: ORKTask {
    return ORKOrderedTask.reactionTimeTaskWithIdentifier(String(TaskIdentifiers.EventReactionTask), intendedUseDescription: nil, maximumStimulusInterval: 10, minimumStimulusInterval: 4, thresholdAcceleration: 0.5, numberOfAttempts: 3, timeout: 3, successSound: UInt32(kAudioServicesPropertyCompletePlaybackIfAppDies), timeoutSound: 0, failureSound: UInt32(kSystemSoundID_Vibrate), options: [])
}


var eventGoNoGoTask: ORKTask {
    var steps = [ORKStep]()
    
    let title = "Square Task"
    let instructionStepOne = ORKInstructionStep(identifier: "EventGoNoGoTaskInstructionOne")
    instructionStepOne.title = title
    instructionStepOne.detailText = "Once you start, you will be presented with a rectangle. Tap the screen when it turns green."
    instructionStepOne.image = UIImage(named: "goNoGoTask_InstructionOne")
    steps += [instructionStepOne]
    
    let goNoGoStep = ORKInstructionStep(identifier: "EventGoNoGoTaskStep")
    goNoGoStep.title = title
    goNoGoStep.detailText = "Square task will be demoed in later."
    steps += [goNoGoStep]
    
    
    return ORKOrderedTask(identifier: String(TaskIdentifiers.EventGoNoGoTask), steps: steps)
}


var eventBalloonTask: ORKTask {
    var steps = [ORKStep]()
    
    let title = "Balloon Task"
    let instructionStepOne = ORKInstructionStep(identifier: "EventBalloonTaskInstructionOne")
    instructionStepOne.title = title
    instructionStepOne.detailText = "Your goal is to inflat the balloon and each tap for inflating is worth $25. Try to earn as much as you can. You have 15 chances."
    instructionStepOne.image = UIImage(named: "balloonTask_InstructionOne")
    steps += [instructionStepOne]
    
    let balloonStep = ORKInstructionStep(identifier: "EventBalloonTaskStep")
    balloonStep.title = title
    balloonStep.detailText = "Balloon task will be demoed in later."
    steps += [balloonStep]
    
    return ORKOrderedTask(identifier: String(TaskIdentifiers.EventBalloonTask), steps: steps)
}


enum BaselineTasks: Int {
    case AlcoholSurvey
    case SVSurvey
    case AudioTask
    case ReactionTask
    case GoNoGoTask
    case BalloonTask
    
    var title: String {
        switch self {
        case .AlcoholSurvey:
            return "Alcohol Survey"
        case .SVSurvey:
            return "Smoke/Vape Survey"
        case .AudioTask:
            return "Audio"
        case .ReactionTask:
            return "Reaction Time"
        case .GoNoGoTask:
            return "Square Task"
        case .BalloonTask:
            return "Balloon Task"
        }
    }
    
    var description: String {
        switch self {
        case .AlcoholSurvey:
            return "Record your Alcohol drinking situation"
        case .SVSurvey:
            return "Record your Smoke/Vape situation"
        case .AudioTask:
            return "Record your voice"
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
        case .AlcoholSurvey:
            return baselineAlcoholSurvey
        case .SVSurvey:
            return baselineSVSurvey
        case .AudioTask:
            return baselineAudioTask
        case .ReactionTask:
            return baselineReactionTask
        case .GoNoGoTask:
            return baselineGoNoGoTask
        case .BalloonTask:
            return baselineBalloonTask
        }
        
    }
    
    var taskRunUUID: String {
        switch self {
        case .AlcoholSurvey:
            return TaskRunUUID.BaselineAlcoholSurvey.taskRunUUID
        case .SVSurvey:
            return TaskRunUUID.BaselineSVSurvey.taskRunUUID
        case .AudioTask:
            return TaskRunUUID.BaselineAudioTask.taskRunUUID
        case .ReactionTask:
            return TaskRunUUID.BaselineReactionTask.taskRunUUID
        case .GoNoGoTask:
            return TaskRunUUID.BaselineGoNoGoTask.taskRunUUID
        case .BalloonTask:
            return TaskRunUUID.BaselineBalloonTask.taskRunUUID
        }
    }
}
