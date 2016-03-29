//
//  CASConstant.swift
//  motion
//
//  Created by judywu on 3/28/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import Foundation
private enum MorningSurveyIdentifiers {
    //// Event Filter
    case MSInstructionStep
    case MSTypeFilterStep
    
    //// Morning Survey Alcohol
    case MSAlcoholDrinksStep
    case MSAlcoholSituationStep
    case MSAlcoholConditionStep
    case MSAlcoholReasonStep
    case MSAlcoholIntentionStep
    case MSAlcoholFutureDrinksStep
    
    //// Morning Survey Smoke/Vape
    case MSSVSituationStep
    case MSSVConditionStep
    case MSSVReasonStep
    case MSSVIntentionStep
    case MSSVPlanStep

}

private enum BaselineSurveyIdentifiers {
    //// Baseline Drug Type Filter
    case BSInstructionStep
    case BSDrugTypeFilterStep

    //// Alcohol Baseline survey
    case BSAlcoholSituationStep
    case BSAlcoholConditionStep
    case BSAlcoholHabbitStep
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

    
    //// Smoke/Vape
    case BSSVFrequencyStep
    case BSSVSituationStep
    case BSSVConditionStep
    case BSSVHabbitStep
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
    
}

private enum EventIdentifiers {
    //// Alcohol Event
    case AlcoholEventDrinksStep
    case AlcoholEventDrinksQuestion
    case AlcoholEventIntoxicationStep
    case AlcoholEventIntoxicationQuestion
    
    //// Smoke/Vape event
    case SVEventLastTimeStep
    
}

private enum ActiveTasks  {
    case YourThought
}

private enum TaskRunUUID  {
    case BaselineSurveyTaskViewController
    case DailySurveyTaskViewController
    case BaselineTappingTaskViewController
    case BaselineReactionTimeTaskViewController
    case BaselineGONoGOTaskViewController
}

private enum OnboardingIdentifiers  {
    case 
}
