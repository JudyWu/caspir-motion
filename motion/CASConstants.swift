//
//  CASConstant.swift
//  motion
//
//  Created by judywu on 3/28/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import Foundation
import ResearchKit

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
    case DSAlcoholFutureDrinkStep
    
    //// Morning Survey Smoke/Vape
    case DSSVFilterStep
    case DSSVNoStep
    case DSSVSurvey
    case DSSVSituationStep
    case DSSVConditionStep
    case DSSVReasonStep
    case DSSVIntentionStep
    case DSSVPlanStep
}

enum TaskIdentifiers {
    //// Daily
    case DailyTappingTask
    case DailyReactionTask
    case DailyGoNoGoTask
    case DailyBalloonTask
    
    //// Baseline
    case BaselineTappingTask
    case BaselineReactionTask
    case BaselineGoNoGoTask
    case BaselineBalloonTask
    
    //// Event 
    case EventTappingTask
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
    case BSAlcoholCompletionStepOne
    case BSAlcoholCompletionStepTwo

    
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
    
}

enum ActiveTasks  {
    case YourThought
}

enum TaskRunUUID  {
    case BaselineSurveyTaskViewController
    case DailySurveyTaskViewController
    case BaselineTappingTaskViewController
    case BaselineReactionTimeTaskViewController
    case BaselineGONoGOTaskViewController
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
//    case RegistrationWaitStep
//    case VerificationStep
    case WrongCodeStep
    case HealthStep
    case ConsentReviewStep
    case PasscodeStep
    case CompletionStep
}




