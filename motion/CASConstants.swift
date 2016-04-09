//
//  CASConstant.swift
//  motion
//
//  Created by judywu on 3/28/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import Foundation
import ResearchKit

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

}

private var BaselineAlcoholSurvey : ORKTask {
    var steps = [ORKStep]()
    
    ///// BS Alcohol question 1
    let BSAlcoholSituationOptionOne = NSLocalizedString("Home", comment: "")
    let BSAlcoholSituationOptionTwo = NSLocalizedString("Bar/Restuarant/Club", comment: "")
    let BSAlcoholSituationOptionThree = NSLocalizedString("Party", comment: "")
    let BSAlcoholSituationOptionFour = NSLocalizedString("Work", comment: "")
    let BSAlcoholSituationOptionFive = NSLocalizedString("Friends' Home", comment: "")
    
    let BSAlcoholSituationTextOptions = [
        ORKTextChoice(text: BSAlcoholSituationOptionOne, value: ""),
        ORKTextChoice(text: BSAlcoholSituationOptionTwo, value: ""),
        ORKTextChoice(text: BSAlcoholSituationOptionThree, value: ""),
        ORKTextChoice(text: BSAlcoholSituationOptionFour, value: ""),
        ORKTextChoice(text: BSAlcoholSituationOptionFive, value: "")
    ]
    
    let BSAlcoholSituationTitle = NSLocalizedString("Please check the situations where you tend drink most often", comment: "")
    
    let BSAlcoholSituationAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: BSAlcoholSituationTextOptions)
    
    let BSAlcoholSituationStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSAlcoholSituationStep), title: BSAlcoholSituationTitle, answer: BSAlcoholSituationAnswerFormat)
    steps += [BSAlcoholSituationStep]
    
    ///// BS Alcohol question 2
    let BSAlcoholConditionOptionOne = NSLocalizedString("Alone", comment: "")
    let BSAlcoholConditionOptionTwo = NSLocalizedString("Family", comment: "")
    let BSAlcoholConditionOptionThree = NSLocalizedString("Friends", comment: "")
    let BSAlcoholConditionOptionFour = NSLocalizedString("Acquaintances", comment: "")
    let BSAlcoholConditionOptionFive = NSLocalizedString("Co-workers", comment: "")
    
    let BSAlcoholConditionTextOptions = [
        ORKTextChoice(text: BSAlcoholConditionOptionOne, value: ""),
        ORKTextChoice(text: BSAlcoholConditionOptionTwo, value: ""),
        ORKTextChoice(text: BSAlcoholConditionOptionThree, value: ""),
        ORKTextChoice(text: BSAlcoholConditionOptionFour, value: ""),
        ORKTextChoice(text: BSAlcoholConditionOptionFive, value: "")

    ]
    
    let BSAlcoholConditionTitle = NSLocalizedString("Who do you most often drink with?", comment: "")
    
    let BSAlcoholConditionAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: BSAlcoholConditionTextOptions)
    
    let BSAlcoholConditionStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSAlcoholConditionStep), title: BSAlcoholConditionTitle, answer: BSAlcoholConditionAnswerFormat)
    steps += [BSAlcoholConditionStep]
    
    ///// BS Alcohol question 3
    let BSAlcoholHabitAnswerFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(7, minimumValue: 1, defaultValue: NSIntegerMax, step: 1, vertical: true, maximumValueDescription: "Most are heavy drinkers", minimumValueDescription: "Most do not drink at all")
    let BSAlcoholHabitTitle = NSLocalizedString("Think about your friends and family overall. Which comes closest to the drinking habits of the people most often?", comment: "")
    let BSAlcoholHabitStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSAlcoholHabitStep), title: BSAlcoholHabitTitle, answer: BSAlcoholHabitAnswerFormat)
    
    steps += [BSAlcoholHabitStep]
    
    //// BS Alcohol question 4
    let BSAlcoholDayOptionOne = NSLocalizedString("Friday", comment: "")
    let BSAlcoholDayOptionTwo = NSLocalizedString("Saturday", comment: "")
    let BSAlcoholDayOptionThree = NSLocalizedString("Sunday", comment: "")
    let BSAlcoholDayOptionFour = NSLocalizedString("Monday", comment: "")
    let BSAlcoholDayOptionFive = NSLocalizedString("Tuesday", comment: "")
    let BSAlcoholDayOptionSix = NSLocalizedString("Wednesday", comment: "")
    let BSAlcoholDayOptionSeven = NSLocalizedString("Thursday", comment: "")
    let BSAlcoholDayOptionEight = NSLocalizedString("No pattern whatsoever", comment: "")
    
    
    let BSAlcoholDayTextOptions = [
        ORKTextChoice(text: BSAlcoholDayOptionOne, value: ""),
        ORKTextChoice(text: BSAlcoholDayOptionTwo, value: ""),
        ORKTextChoice(text: BSAlcoholDayOptionThree, value: ""),
        ORKTextChoice(text: BSAlcoholDayOptionFour, value: ""),
        ORKTextChoice(text: BSAlcoholDayOptionFive, value: ""),
        ORKTextChoice(text: BSAlcoholDayOptionSix, value: ""),
        ORKTextChoice(text: BSAlcoholDayOptionSeven, value: ""),
        ORKTextChoice(text: BSAlcoholDayOptionEight, value: "")
    ]
    
    let BSAlcoholDayTitle = NSLocalizedString("What days do you usually drink the most (if everyday, check all)?", comment: "")
    
    let BSAlcoholDayAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices: BSAlcoholDayTextOptions)
    
    let BSAlcoholDayStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSAlcoholDayStep), title: BSAlcoholDayTitle, answer: BSAlcoholDayAnswerFormat)
    
    steps += [BSAlcoholDayStep]
    
    //// BS Alcohol question 5 
    let BSAlcoholTriggerSituationOptionOne = NSLocalizedString("You are with one friend who drinks", comment: "")
    let BSAlcoholTriggerSituationOptionTwo = NSLocalizedString("You are with a group of friends who drink", comment: "")
    let BSAlcoholTriggerSituationOptionThree = NSLocalizedString("At an event or celebration", comment: "")
    let BSAlcoholTriggerSituationOptionFour = NSLocalizedString("Alone in the house", comment: "")
    let BSAlcoholTriggerSituationOptionFive = NSLocalizedString("Have a transition (e.g., train home)", comment: "")
    let BSAlcoholTriggerSituationOptionSix = NSLocalizedString("Doing something where you usually have a drink (e.g., cooking, watching game)", comment: "")
    let BSAlcoholTriggerSituationOptionSeven = NSLocalizedString("Just have alcohol in the house", comment: "")
    
    
    let BSAlcoholTriggerSituationTextOptions = [
        ORKTextChoice(text: BSAlcoholTriggerSituationOptionOne, value: ""),
        ORKTextChoice(text: BSAlcoholTriggerSituationOptionTwo, value: ""),
        ORKTextChoice(text: BSAlcoholTriggerSituationOptionThree, value: ""),
        ORKTextChoice(text: BSAlcoholTriggerSituationOptionFour, value: ""),
        ORKTextChoice(text: BSAlcoholTriggerSituationOptionFive, value: ""),
        ORKTextChoice(text: BSAlcoholTriggerSituationOptionSix, value: ""),
        ORKTextChoice(text: BSAlcoholTriggerSituationOptionSeven, value: "")
    ]
    
    let BSAlcoholTriggerSituationTitle = NSLocalizedString("Please check up to two situations that usually trigger your to drink most heavily.", comment: "")
    
    let BSAlcoholTriggerSituationAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices: BSAlcoholTriggerSituationTextOptions)
    
    let BSAlcoholTriggerSituationStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSAlcoholTriggerSituationStep), title: BSAlcoholTriggerSituationTitle, answer: BSAlcoholTriggerSituationAnswerFormat)
    
    steps += [BSAlcoholTriggerSituationStep]

    
    //// BS Alcohol question 6 
    let BSAlcoholTriggerFeelingOptionOne = NSLocalizedString("To celebrate, party and have a good time", comment: "")
    let BSAlcoholTriggerFeelingOptionTwo = NSLocalizedString("To more be social, and talkative and friendly with others", comment: "")
    let BSAlcoholTriggerFeelingOptionThree = NSLocalizedString("To feel less anxious or stressed", comment: "")
    let BSAlcoholTriggerFeelingOptionFour = NSLocalizedString("To unwind or relax after a long day", comment: "")
    let BSAlcoholTriggerFeelingOptionFive = NSLocalizedString("To feel less bored", comment: "")
    let BSAlcoholTriggerFeelingOptionSix = NSLocalizedString("To feel happier and alive", comment: "")
    let BSAlcoholTriggerFeelingOptionSeven = NSLocalizedString("To escape or forget about problems", comment: "")
    let BSAlcoholTriggerFeelingOptionEight = NSLocalizedString("I like the taste", comment: "")
    let BSAlcoholTriggerFeelingOptionNine = NSLocalizedString("It is a habit and I just do it without thinking", comment: "")
    let BSAlcoholTriggerFeelingOptionTen = NSLocalizedString("I like the whole experience/story associated with drinking", comment: "")
    
    
    let BSAlcoholTriggerFeelingTextOptions = [
        ORKTextChoice(text: BSAlcoholTriggerFeelingOptionOne, value: ""),
        ORKTextChoice(text: BSAlcoholTriggerFeelingOptionTwo, value: ""),
        ORKTextChoice(text: BSAlcoholTriggerFeelingOptionThree, value: ""),
        ORKTextChoice(text: BSAlcoholTriggerFeelingOptionFour, value: ""),
        ORKTextChoice(text: BSAlcoholTriggerFeelingOptionFive, value: ""),
        ORKTextChoice(text: BSAlcoholTriggerFeelingOptionSix, value: ""),
        ORKTextChoice(text: BSAlcoholTriggerFeelingOptionSeven, value: ""),
        ORKTextChoice(text: BSAlcoholTriggerFeelingOptionEight, value: ""),
        ORKTextChoice(text: BSAlcoholTriggerFeelingOptionNine, value: ""),
        ORKTextChoice(text: BSAlcoholTriggerFeelingOptionTen, value: "")
    ]
    
    let BSAlcoholTriggerFeelingTitle = NSLocalizedString("Please check up to three feelings that usually trigger you to drink most heavily.", comment: "")
    
    let BSAlcoholTriggerFeelingAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices: BSAlcoholTriggerFeelingTextOptions)
    
    let BSAlcoholTriggerFeelingStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSAlcoholTriggerFeelingStep), title: BSAlcoholTriggerFeelingTitle, answer: BSAlcoholTriggerFeelingAnswerFormat)
    
    steps += [BSAlcoholTriggerFeelingStep]
    
    //// BS Alcohol question 7 
    let BSAlcoholTypeOptionOne = NSLocalizedString("Beer", comment: "")
    let BSAlcoholTypeOptionTwo = NSLocalizedString("Wine", comment: "")
    let BSAlcoholTypeOptionThree = NSLocalizedString("Liquor", comment: "")
    
    let BSAlcoholTypeTextOptions = [
        ORKTextChoice(text: BSAlcoholTypeOptionOne, value: ""),
        ORKTextChoice(text: BSAlcoholTypeOptionTwo, value: ""),
        ORKTextChoice(text: BSAlcoholTypeOptionThree, value: "")
    ]
    let BSAlcoholTypeTitle = NSLocalizedString("Over the past 3 months what is your primary type of alcohol intake?", comment: "")
    
    let BSAlcoholTypeAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: BSAlcoholTypeTextOptions)
    
    let BSAlcoholTypeStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSAlcoholTypeStep), title: BSAlcoholTypeTitle, answer: BSAlcoholTypeAnswerFormat)
    
    steps += [BSAlcoholTypeStep]
    
    //// BS Alcohol question 8 
    let BSAlcoholSymptomOptionOne = NSLocalizedString("It would not bother me", comment: "")
    let BSAlcoholSymptomOptionTwo = NSLocalizedString("I would feel slightly anxious or irritated", comment: "")
    let BSAlcoholSymptomOptionThree = NSLocalizedString("My anxiety or irritation would mount, but remain manageable", comment: "")
    let BSAlcoholSymptomOptionFour = NSLocalizedString("I would feel very anxious and irritated and have difficulty managing", comment: "")
    
    let BSAlcoholSymptomTextOptions = [
        ORKTextChoice(text: BSAlcoholSymptomOptionOne, value: ""),
        ORKTextChoice(text: BSAlcoholSymptomOptionTwo, value: ""),
        ORKTextChoice(text: BSAlcoholSymptomOptionThree, value: ""),
        ORKTextChoice(text: BSAlcoholSymptomOptionFour, value: "")
    ]
    let BSAlcoholSymptomTitle = NSLocalizedString("If you were prevented from drinking when you usually drink for a few days, how anxious or irritated would you feel?", comment: "")
    
    let BSAlcoholSymptomAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: BSAlcoholSymptomTextOptions)
    
    let BSAlcoholSymptomStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSAlcoholSymptomStep), title: BSAlcoholSymptomTitle, answer: BSAlcoholSymptomAnswerFormat)
    
    steps += [BSAlcoholSymptomStep]
    
    //// BS Alcohol question 9 
    let BSAlcoholExtraInfoAnswerFormat = ORKAnswerFormat.textAnswerFormat()
    let BSAlcoholExtraInfoTitle = NSLocalizedString("Please let us know anything about your drinking including people, situations, and feelings that we may have missed?", comment: "")
    let BSAlcoholExtraInfoStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSAlcoholExtraInfoStep), title: BSAlcoholExtraInfoTitle, answer: BSAlcoholExtraInfoAnswerFormat)
    
    steps += [BSAlcoholExtraInfoStep]
    
    //// BS Alcohol question 10
    let BSAlcoholImportanceAnswerFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(8, minimumValue: 0, defaultValue: NSIntegerMax, step: 1, vertical: true, maximumValueDescription: "Extremely Important", minimumValueDescription: "Not at all important")
    let BSAlcoholImportanceTitle = NSLocalizedString("How important is it for you to reduce your drinking?", comment: "")
    let BSAlcoholImportanceStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSAlcoholImportanceStep), title: BSAlcoholImportanceTitle, answer: BSAlcoholImportanceAnswerFormat)
    
    steps += [BSAlcoholImportanceStep]
    
    //// if question 10 answer > 1
    //// BS Alcohol question 11
    let BSAlcoholConfidenceAnswerFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(8, minimumValue: 0, defaultValue: NSIntegerMax, step: 1, vertical: true, maximumValueDescription: "Extremely Confident", minimumValueDescription: "Not at all confident")
    let BSAlcoholConfidenceTitle = NSLocalizedString("How confident are you that you can succeed in reduing your drinking?", comment: "")
    let BSAlcoholConfidenceStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSAlcoholConfidenceStep), title: BSAlcoholConfidenceTitle, answer: BSAlcoholConfidenceAnswerFormat)
    
    steps += [BSAlcoholConfidenceStep]

    //// BS Alcohol question 12
    let BSAlcoholEffortAnswerFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(8, minimumValue: 0, defaultValue: NSIntegerMax, step: 1, vertical: true, maximumValueDescription: "Extremely Effort(hard)", minimumValueDescription: "No effort at all(easy)")
    let BSAlcoholEffortTitle = NSLocalizedString("How much effort will it take to reduce your drinking in the situations you usually drink most heavily?", comment: "")
    let BSAlcoholEffortStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSAlcoholEffortStep), title: BSAlcoholEffortTitle, answer: BSAlcoholEffortAnswerFormat)
    
    steps += [BSAlcoholEffortStep]

    //// BS Alcohol question 13
    let BSAlcoholPlanOptionOne = NSLocalizedString("Yes", comment: "")
    let BSAlcoholPlanOptionTwo = NSLocalizedString("No", comment: "")
    
    let BSAlcoholPlanTextOptions = [
        ORKTextChoice(text: BSAlcoholPlanOptionOne, value: ""),
        ORKTextChoice(text: BSAlcoholPlanOptionTwo, value: "")
    ]
    
    let BSAlcoholPlanTitle = NSLocalizedString("Do you have a specific plan to reduce your drinking (e.g., avoid certain situations, change routines)?", comment: "")
    
    let BSAlcoholPlanAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: BSAlcoholPlanTextOptions)
    
    let BSAlcoholPlanStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSAlcoholPlanStep), title: BSAlcoholPlanTitle, answer: BSAlcoholPlanAnswerFormat)
    
    steps += [BSAlcoholPlanStep]
    
    return ORKOrderedTask(identifier: String(BaselineSurveyIdentifiers.BSAlcoholSurvey), steps: steps)
    
}
private var BaselineSVSurvey : ORKTask {


}
private var DailyAlcoholSurvey : ORKTask {

     //// Daily Alcohol question 1
     //// Daily Alcohol question 2
     //// Daily Alcohol question 3
     //// Daily Alcohol question 4






}
private var DailySVSurvey: ORKTask {

}
private var EventAlcoholTask : ORKTask {

}
private var EventSVTask : ORKTask {

}





