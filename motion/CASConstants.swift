//
//  CASConstant.swift
//  motion
//
//  Created by judywu on 3/28/16.
//  Copyright © 2016 CASPIR. All rights reserved.

import Foundation
import ResearchKit
import RealmSwift

enum DailySurveyIdentifiers {
    //// Event Filter
    case DSInstructionStep
    case DSAlcoholDrinkFilterStep
    case DSAlcoholNoDrinkStep
    
    //// Morning Survey Alcohol
    case DSAlcoholSurvey
    case DSAlcoholDrinkStep
    case DSAlcoholSituationStep
    case DSAlcoholConditionStep
    case DSAlcoholReasonStep
    case DSAlcoholIntentionStep
    case DSAlcoholSleepStep
    case DSAlcoholFutureDrinkStep
    
    //// Morning Survey Smoke/Vape
    case DSSVFilterStep
    case DSSVNoStep
    case DSSVSurvey
    case DSSVIntoxicationStep
    case DSSVSituationStep
    case DSSVConditionStep
    case DSSVReasonStep
    case DSSVIntentionStep
    case DSSVPlanStep
}

enum TaskIdentifiers {
    //// Daily
    case DailyAudioTask
    case DailyReactionTask
    case DailyGoNoGoTask
    case DailyBalloonTask
    
    //// Baseline
    case BaselineAudioTask
    case BaselineReactionTask
    case BaselineGoNoGoTask
    case BaselineBalloonTask
    
    //// Event 
    case EventAudioTask
    case EventReactionTask
    case EventGoNoGoTask
    case EventBalloonTask 
}

enum BaselineSurveyIdentifiers {
    //// Baseline Drug Type Filter
    case BSInstructionStep
    case BSDrugTypeFilterStep

    //// Alcohol Baseline survey
    case BSAlcoholSurvey
    case BSAlcoholSituationStep
    case BSAlcoholConditionStep
    case BSAlcoholHabitStep
    case BSAlcoholDayStep
    case BSAlcoholTriggerSituationStep
    case BSAlcoholTriggerFeelingStep
    case BSAlcoholTypeStep
    case BSAlcoholSymptomStep
    case BSAlcoholExtraInfoStep
    case BSAlcoholImportanceStep
    case BSAlcoholConfidenceStep
    case BSAlcoholEffortStep
    case BSAlcoholPlanStep
//    case BSAlcoholCompletionStepOne
    case BSAlcoholCompletionStep

    
    //// Smoke/Vape
    case BSSVSurvey
    case BSSVFrequencyStep
    case BSSVSituationStep
    case BSSVConditionStep
    case BSSVHabitStep
    case BSSVDayStep
    case BSSVTriggerSituationStep
    case BSSVTriggerFeelingStep
    case BSSVTypeStep
    case BSSVSymptomStep
    case BSSVExtraInfoStep
    case BSSVImportanceStep
    case BSSVConfidenceStep
    case BSSVEffortStep
    case BSSVPlanStep
    case BSSVCompletionStepOne
    case BSSVCompletionStepTwo
    
}

enum EventIdentifiers {
    //// Alcohol Event
    case AlcoholEventSurvey
    case AlcoholEventDrinkStep
    case AlcoholEventIntoxicationStep
    
    //// Smoke/Vape event
    case SVEventSurvey
    case SVEventLastTimeStep
    case SVEventIntoxicationStep
    
}

enum OtherTasksIdentifiers  {
    case YourThought
    case ThoughtQuestionStep
    
    case LogIn
    case LogInItem
    case LogInStep
    case WaitStep
}


let logInuuid = NSUUID().UUIDString
let onboardinguuid  = NSUUID().UUIDString
let baselineAlcoholSurveyuuid = NSUUID().UUIDString
let baselineSVSurveyuuid = NSUUID().UUIDString
let baselineAudioTaskuuid = NSUUID().UUIDString
let baselineReactionTaskuuid = NSUUID().UUIDString
let baselineGoNoGoTaskuuid = NSUUID().UUIDString
let baselineBalloonTaskuuid = NSUUID().UUIDString

let morningAlcoholTaskuuid = NSUUID().UUIDString
let morningSVTaskuuid = NSUUID().UUIDString
let morningAlcoholBothTaskuuid = NSUUID().UUIDString
let morningSVBothTaskuuid = NSUUID().UUIDString
let morningAudioTaskuuid = NSUUID().UUIDString
let morningReactionTaskuuid = NSUUID().UUIDString
let morningGoNoGoTaskuuid = NSUUID().UUIDString
let morningBalloonTaskuuid = NSUUID().UUIDString


let eventAlcoholTaskuuid = NSUUID().UUIDString
let eventSVTaskuuid = NSUUID().UUIDString
let eventAlcoholBothTaskuuid = NSUUID().UUIDString
let eventSVBothTaskuuid = NSUUID().UUIDString
let eventAudioTaskuuid = NSUUID().UUIDString
let eventReactionTaskuuid = NSUUID().UUIDString
let eventGoNoGoTaskuuid = NSUUID().UUIDString
let eventBalloonTaskuuid = NSUUID().UUIDString
let yourThoughtuuid = NSUUID().UUIDString



enum TaskRunUUID  {
    //// Login
    case LogInTask
    
    //// Onboarding
    case OnboardingTask
    
    //// Baseline
    case BaselineAlcoholSurvey
    case BaselineSVSurvey
    case BaselineAudioTask
    case BaselineReactionTask
    case BaselineGoNoGoTask
    case BaselineBalloonTask
    
    //// Daily 
    case DailyAlcoholTask
    case DailySVTask
    case DailyAlcoholBothTask
    case DailySVBothTask
    case DailyAudioTask
    case DailyReactionTask
    case DailyGoNoGoTask
    case DailyBalloonTask
    
    
    //// Event 
    case EventAlcoholTask
    case EventSVTask
    case EventAlcoholBothTask
    case EventSVBothTask
    case EventAudioTask
    case EventReactionTask
    case EventGoNoGoTask
    case EventBalloonTask

    case YourThought
    struct UUID {
        let onBoardinguuid = NSUUID().UUIDString
    }
    
    var taskRunUUID: String {
        switch self {
        case .LogInTask:
            return logInuuid
        case .OnboardingTask:
            return onboardinguuid
        case .BaselineAlcoholSurvey:
            return baselineAlcoholSurveyuuid
        case .BaselineSVSurvey:
            return baselineSVSurveyuuid
        case .BaselineAudioTask:
            return baselineAudioTaskuuid
        case .BaselineReactionTask:
            return baselineReactionTaskuuid
        case .BaselineGoNoGoTask:
            return baselineGoNoGoTaskuuid
        case .BaselineBalloonTask:
            return baselineBalloonTaskuuid
        
            
        case .DailyAlcoholTask:
            return morningAlcoholTaskuuid
        case .DailySVTask:
            return morningSVTaskuuid
        case .DailyAlcoholBothTask:
            return morningAlcoholBothTaskuuid
        case .DailySVBothTask:
            return morningSVBothTaskuuid
        case .DailyAudioTask:
            return morningAudioTaskuuid
        case .DailyReactionTask:
            return morningReactionTaskuuid
        case .DailyGoNoGoTask:
            return morningGoNoGoTaskuuid
        case .DailyBalloonTask:
            return morningBalloonTaskuuid
        
            
        case .EventAlcoholTask:
            return eventAlcoholTaskuuid
        case .EventSVTask:
            return eventSVTaskuuid
        case .EventAlcoholBothTask:
            return eventAlcoholBothTaskuuid
        case .EventSVBothTask:
            return eventSVBothTaskuuid
        case .EventAudioTask:
            return eventAudioTaskuuid
        case .EventReactionTask:
            return eventReactionTaskuuid
        case .EventGoNoGoTask:
            return eventGoNoGoTaskuuid
        case .EventBalloonTask:
            return eventBalloonTaskuuid
        case .YourThought:
            return yourThoughtuuid
        }
    }
}


enum OnboardingIdentifiers  {
    /////Eligibility
    case OnboardingTask
    case SubstanceTypeStep
    case EligibilityFormStepOne
    case EligibilityFormStepTwo
    case EligibilityFormStepThree

    case EligibilityFormQuestion1
    case EligibilityFormQuestion2
    case EligibilityFormQuestion3
    case EligibilityFormQuestion4
    case EligibilityFormQuestion5
    case EligibilityFormQuestion6
    case EligibilityFormQuestion7
    case EligibilityFormQuestion8
    
    case IneligibleStep
    case EligibleStep
    
    case VisualConsentStep
    case RegistrationStep
    case WrongCodeStep
    case HealthStep
    case ConsentReviewStep
    case PasscodeStep
    case CompletionStep
}


/// For generate feedbacks ID
func randomID() -> NSString {
    let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
    let randomString : NSMutableString = NSMutableString(capacity: 36)
    
    for (var i=0; i < 36; i++){
        let length = UInt32 (letters.length)
        let rand = arc4random_uniform(length)
        randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
    }
    return randomString
}


func getAlcoholLocation() -> [ORKRangedPoint] {
    let prefs = NSUserDefaults.standardUserDefaults()
    let participantID = prefs.stringForKey("participantID")!
    
    
    let realm = try! Realm()
    let currentParticipantSurveys = realm.objects(Participant).filter("ID == '\(participantID)'").first!.surveys.filter("name = 'DSAlcoholSurvey'")
    
    print("\(currentParticipantSurveys)")
    
    var aLocation1 = 0
    var aLocation1Array = [Int]()
    
    var aLocation2 = 0
    var aLocation2Array = [Int]()
    
    var aLocation3 = 0
    var aLocation3Array = [Int]()
    
    var aLocation4 = 0
    var aLocation4Array = [Int]()
    
    var aLocation7 = 0
    var aLocation7Array = [Int]()
    
    var aLocation99 = 0
    var aLocation99Array = [Int]()
    
    for i in 0..<currentParticipantSurveys.count {
        if currentParticipantSurveys[i].aLocation == 1 {
            aLocation1Array.append(currentParticipantSurveys[i].totalDrinking)
            aLocation1 += 1
        } else if currentParticipantSurveys[i].aLocation == 2 {
            aLocation2Array.append(currentParticipantSurveys[i].totalDrinking)
            aLocation2 += 1
        } else if currentParticipantSurveys[i].aLocation == 3 {
            aLocation3Array.append(currentParticipantSurveys[i].totalDrinking)
            aLocation3 += 1
        } else if currentParticipantSurveys[i].aLocation == 4 {
            aLocation4Array.append(currentParticipantSurveys[i].totalDrinking)
            aLocation4 += 1
        } else if currentParticipantSurveys[i].aLocation == 7 {
            aLocation7Array.append(currentParticipantSurveys[i].totalDrinking)
            aLocation7 += 1
        } else if currentParticipantSurveys[i].aLocation == 99 {
            aLocation99Array.append(currentParticipantSurveys[i].totalDrinking)
            aLocation99 += 1
        }
    }
    var average1 = 0
    if aLocation1 != 0 {
        average1 = aLocation1Array.reduce(0, combine: +)/aLocation1
    }
    
    var average2 = 0
    if aLocation2 != 0 {
        average2 = aLocation2Array.reduce(0, combine: +)/aLocation2
    }
    
    var average3 = 0
    if aLocation3 != 0 {
        average3 = aLocation3Array.reduce(0, combine: +)/aLocation3
    }
    
    var average4 = 0
    if aLocation4 != 0 {
        average4 = aLocation4Array.reduce(0, combine: +)/aLocation4
    }
    
    var average7 = 0
    if aLocation7 != 0 {
        average7 = aLocation7Array.reduce(0, combine: +)/aLocation7
    }
    var average99 = 0
    if aLocation99 != 0 {
        average99 = aLocation99Array.reduce(0, combine: +)/aLocation99
    }
    
    
    let locationRangedPoints = [
        ORKRangedPoint(minimumValue: 0, maximumValue: CGFloat(average1)),
        ORKRangedPoint(minimumValue: 0, maximumValue: CGFloat(average2)),
        ORKRangedPoint(minimumValue: 0, maximumValue: CGFloat(average3)),
        ORKRangedPoint(minimumValue: 0, maximumValue: CGFloat(average4)),
        ORKRangedPoint(minimumValue: 0, maximumValue: CGFloat(average7)),
        ORKRangedPoint(minimumValue: 0, maximumValue: CGFloat(average99))
    ]
    
    return locationRangedPoints
}

func getSmokeLocation() -> [ORKRangedPoint] {
    let prefs = NSUserDefaults.standardUserDefaults()
    let participantID = prefs.stringForKey("participantID")!
    
    let realm = try! Realm()
    let currentParticipantSurveys = realm.objects(Participant).filter("ID == '\(participantID)'").first!.surveys.filter("name = 'DSSVSurvey'")
    
    var aLocation1 = 0
    var aLocation1Array = [Int]()
    
    var aLocation2 = 0
    var aLocation2Array = [Int]()
    
    var aLocation3 = 0
    var aLocation3Array = [Int]()
    
    var aLocation4 = 0
    var aLocation4Array = [Int]()
    
    var aLocation7 = 0
    var aLocation7Array = [Int]()
    
    var aLocation99 = 0
    var aLocation99Array = [Int]()
    
    for i in 0..<currentParticipantSurveys.count {
        if currentParticipantSurveys[i].sLocation == 1 {
            aLocation1Array.append(currentParticipantSurveys[i].sIntoxicationAM)
            aLocation1 += 1
        } else if currentParticipantSurveys[i].sLocation == 2 {
            aLocation2Array.append(currentParticipantSurveys[i].sIntoxicationAM)
            aLocation2 += 1
        } else if currentParticipantSurveys[i].sLocation == 3 {
            aLocation3Array.append(currentParticipantSurveys[i].sIntoxicationAM)
            aLocation3 += 1
        } else if currentParticipantSurveys[i].sLocation == 4 {
            aLocation4Array.append(currentParticipantSurveys[i].sIntoxicationAM)
            aLocation4 += 1
        } else if currentParticipantSurveys[i].sLocation == 7 {
            aLocation7Array.append(currentParticipantSurveys[i].sIntoxicationAM)
            aLocation7 += 1
        } else if currentParticipantSurveys[i].sLocation == 99 {
            aLocation99Array.append(currentParticipantSurveys[i].sIntoxicationAM)
            aLocation99 += 1
        }
    }
    
    var average1 = 0
    if aLocation1 != 0 {
        average1 = aLocation1Array.reduce(0, combine: +)/aLocation1
    }
    
    var average2 = 0
    if aLocation2 != 0 {
        average2 = aLocation2Array.reduce(0, combine: +)/aLocation2
    }
    
    var average3 = 0
    if aLocation3 != 0 {
        average3 = aLocation3Array.reduce(0, combine: +)/aLocation3
    }
    
    var average4 = 0
    if aLocation4 != 0 {
        average4 = aLocation4Array.reduce(0, combine: +)/aLocation4
    }
    
    var average7 = 0
    if aLocation7 != 0 {
        average7 = aLocation7Array.reduce(0, combine: +)/aLocation7
    }
    var average99 = 0
    if aLocation99 != 0 {
        average99 = aLocation99Array.reduce(0, combine: +)/aLocation99
    }
    
    
    let locationRangedPoints = [
        ORKRangedPoint(minimumValue: 0, maximumValue: CGFloat(average1)),
        ORKRangedPoint(minimumValue: 0, maximumValue: CGFloat(average2)),
        ORKRangedPoint(minimumValue: 0, maximumValue: CGFloat(average3)),
        ORKRangedPoint(minimumValue: 0, maximumValue: CGFloat(average4)),
        ORKRangedPoint(minimumValue: 0, maximumValue: CGFloat(average7)),
        ORKRangedPoint(minimumValue: 0, maximumValue: CGFloat(average99))
    ]
    
    return locationRangedPoints
}

func getAlcoholLimitation() -> [ORKRangedPoint]{
    let prefs = NSUserDefaults.standardUserDefaults()
    let participantID = prefs.stringForKey("participantID")!
    
    let realm = try! Realm()
    let currentParticipantSurveys = realm.objects(Participant).filter("ID == '\(participantID)'").first!.surveys.filter("name = 'DSAlcoholSurvey'")
    
    var aLimitationYes = 0
    var aLimitationYesArray = [Int]()
    
    var aLimitationNo = 0
    var aLimitationNoArray = [Int]()
    
    for i in 0..<currentParticipantSurveys.count {
        if currentParticipantSurveys[i].aLimitation == "Yes" {
            aLimitationYesArray.append(currentParticipantSurveys[i].totalDrinking)
            aLimitationYes += 1
        } else if currentParticipantSurveys[i].aLimitation == "No" {
            aLimitationNoArray.append(currentParticipantSurveys[i].totalDrinking)
            aLimitationNo += 1
        }
    }
    var averageYes = 0
    if aLimitationYes != 0 {
        averageYes = aLimitationYesArray.reduce(0, combine: +)/aLimitationYes
    }
    
    var averageNo = 0
    if aLimitationNo != 0 {
        averageNo = aLimitationNoArray.reduce(0, combine: +)/aLimitationNo
    }
    
    
    
    
    let limitationRangedPoints = [
        ORKRangedPoint(minimumValue: 0, maximumValue: CGFloat(averageYes)),
        ORKRangedPoint(minimumValue: 0, maximumValue: CGFloat(averageNo))
    ]
    
    return limitationRangedPoints
}

func getSmokeLimitation() -> [ORKRangedPoint]{
    let prefs = NSUserDefaults.standardUserDefaults()
    let participantID = prefs.stringForKey("participantID")!
    
    let realm = try! Realm()
    let currentParticipantSurveys = realm.objects(Participant).filter("ID == '\(participantID)'").first!.surveys.filter("name = 'DSSVSurvey'")
    
    var aLimitationYes = 0
    var aLimitationYesArray = [Int]()
    
    var aLimitationNo = 0
    var aLimitationNoArray = [Int]()
    
    for i in 0..<currentParticipantSurveys.count {
        if currentParticipantSurveys[i].sLimitation == "Yes" {
            aLimitationYesArray.append(currentParticipantSurveys[i].sIntoxicationAM)
            aLimitationYes += 1
        } else if currentParticipantSurveys[i].sLimitation == "No" {
            aLimitationNoArray.append(currentParticipantSurveys[i].sIntoxicationAM)
            aLimitationNo += 1
        }
    }
    
    var averageYes = 0
    if aLimitationYes != 0 {
        averageYes = aLimitationYesArray.reduce(0, combine: +)/aLimitationYes
    }
    
    var averageNo = 0
    if aLimitationNo != 0 {
        averageNo = aLimitationNoArray.reduce(0, combine: +)/aLimitationNo
    }
    
    let limitationRangedPoints = [
        ORKRangedPoint(minimumValue: 0, maximumValue: CGFloat(averageYes)),
        ORKRangedPoint(minimumValue: 0, maximumValue: CGFloat(averageNo))
    ]
    
    return limitationRangedPoints
}
















