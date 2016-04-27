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
    let intendedUseDescription = "Finger tapping is a universal way to communicate."
    return ORKOrderedTask.audioTaskWithIdentifier(String(TaskIdentifiers.BaselineAudioTask), intendedUseDescription: intendedUseDescription, speechInstruction: intendedUseDescription, shortSpeechInstruction: intendedUseDescription, duration: 20, recordingSettings: nil, options: [])
}

var baselineReactionTask: ORKTask {
    let intendedUseDescription = "See how fast you react to the dot"
    
    return ORKOrderedTask.reactionTimeTaskWithIdentifier(String(TaskIdentifiers.BaselineReactionTask), intendedUseDescription: intendedUseDescription, maximumStimulusInterval: 10, minimumStimulusInterval: 4, thresholdAcceleration: 0.5, numberOfAttempts: 3, timeout: 3, successSound: UInt32(kAudioServicesPropertyCompletePlaybackIfAppDies), timeoutSound: 0, failureSound: UInt32(kSystemSoundID_Vibrate), options: [])
}

var baselineGoNoGoTask: ORKTask {
    let intendedUseDescription = "For accessing your implusivity"
    return ORKOrderedTask.toneAudiometryTaskWithIdentifier(String(TaskIdentifiers.BaselineGoNoGoTask), intendedUseDescription: intendedUseDescription, speechInstruction: nil, shortSpeechInstruction: nil, toneDuration: 20, options: [])
}

var baselineBalloonTask: ORKTask {
    let intendedUseDescription = "For accessing your implusivity"

    return ORKOrderedTask.towerOfHanoiTaskWithIdentifier(String(TaskIdentifiers.BaselineBalloonTask), intendedUseDescription: intendedUseDescription, numberOfDisks: 5, options: [])
}


//// Daily 

var dailyAudioTask: ORKTask {
    let intendedUseDescription = "For accessing your implusivity"
    
    return ORKOrderedTask.audioTaskWithIdentifier(String(TaskIdentifiers.DailyAudioTask), intendedUseDescription: intendedUseDescription, speechInstruction: intendedUseDescription, shortSpeechInstruction: intendedUseDescription, duration: 20, recordingSettings: nil, options: [])
}

var dailyGoNoGoTask: ORKTask {
    let intendedUseDescription = "For accessing your implusivity"
    return ORKOrderedTask.toneAudiometryTaskWithIdentifier(String(TaskIdentifiers.DailyGoNoGoTask), intendedUseDescription: intendedUseDescription, speechInstruction: nil, shortSpeechInstruction: nil, toneDuration: 20, options: [])
}

var dailyReactionTask: ORKTask {
    let intendedUseDescription = "For accessing your implusivity"
    return ORKOrderedTask.reactionTimeTaskWithIdentifier(String(TaskIdentifiers.DailyReactionTask), intendedUseDescription: intendedUseDescription, maximumStimulusInterval: 10, minimumStimulusInterval: 4, thresholdAcceleration: 0.5, numberOfAttempts: 3, timeout: 3, successSound: UInt32(kAudioServicesPropertyCompletePlaybackIfAppDies), timeoutSound: 0, failureSound: UInt32(kSystemSoundID_Vibrate), options: [])

}

var dailyBalloonTask: ORKTask {
    let intendedUseDescription = "For accessing your implusivity"
    return ORKOrderedTask.towerOfHanoiTaskWithIdentifier(String(TaskIdentifiers.BaselineBalloonTask), intendedUseDescription: intendedUseDescription, numberOfDisks: 5, options: [])
}

////// Event
var eventAudioTask : ORKTask {
    let intendedUseDescription = "Finger tapping is a universal way to communicate."
    
    return ORKOrderedTask.audioTaskWithIdentifier(String(TaskIdentifiers.EventAudioTask), intendedUseDescription: intendedUseDescription, speechInstruction: intendedUseDescription, shortSpeechInstruction: intendedUseDescription, duration: 20, recordingSettings: nil, options: [])
}


var eventReactionTask: ORKTask {
    let intendedUseDescription = "Finger tapping is a universal way to communicate."
    
    return ORKOrderedTask.reactionTimeTaskWithIdentifier(String(TaskIdentifiers.EventReactionTask), intendedUseDescription: intendedUseDescription, maximumStimulusInterval: 10, minimumStimulusInterval: 4, thresholdAcceleration: 0.5, numberOfAttempts: 3, timeout: 3, successSound: UInt32(kAudioServicesPropertyCompletePlaybackIfAppDies), timeoutSound: 0, failureSound: UInt32(kSystemSoundID_Vibrate), options: [])
}


var eventGoNoGoTask: ORKTask {
    let intendedUseDescription = "Finger tapping is a universal way to communicate."
    return ORKOrderedTask.toneAudiometryTaskWithIdentifier(String(TaskIdentifiers.EventGoNoGoTask), intendedUseDescription: intendedUseDescription, speechInstruction: nil, shortSpeechInstruction: nil, toneDuration: 20, options: [])
}


var eventBalloonTask: ORKTask {
    let intendedUseDescription = "Finger tapping is a universal way to communicate."
    return ORKOrderedTask.towerOfHanoiTaskWithIdentifier(String(TaskIdentifiers.EventBalloonTask), intendedUseDescription: intendedUseDescription, numberOfDisks: 5, options: [])

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
            return "Implusivity"
        case .BalloonTask:
            return "Risk taking"
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
