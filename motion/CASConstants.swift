//
//  CASConstant.swift
//  motion
//
//  Created by judywu on 3/28/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import Foundation
import ResearchKit

private enum DailySurveyIdentifiers {
    //// Event Filter
    case DSInstructionStep
    case DSTypeFilterStep
    
    //// Morning Survey Alcohol
    case DSAlcoholSurvey
    case DSAlcoholDrinkStep
    case DSAlcoholSituationStep
    case DSAlcoholConditionStep
    case DSAlcoholReasonStep
    case DSAlcoholIntentionStep
    case DSAlcoholFutureDrinkStep
    
    //// Morning Survey Smoke/Vape
    case DSSVSurvey
    case DSSVSituationStep
    case DSSVConditionStep
    case DSSVReasonStep
    case DSSVIntentionStep
    case DSSVPlanStep

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
    case AlcoholEventSurvey
    case AlcoholEventDrinkStep
    case AlcoholEventIntoxicationStep
    
    //// Smoke/Vape event
    case SVEventSurvey
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
    var steps = [ORKStep]()
    
    /// Baselince SV question 1
    let optionOne = NSLocalizedString("0", comment: "")
    let optionTwo = NSLocalizedString("1", comment: "")
    let optionThree = NSLocalizedString("2", comment: "")
    let optionFour = NSLocalizedString("3", comment: "")
    let optionFive = NSLocalizedString("4", comment: "")
    let optionSix = NSLocalizedString("5", comment: "")
    let optionSeven = NSLocalizedString("6", comment: "")
    let optionEight = NSLocalizedString("7", comment: "")
    let optionNine = NSLocalizedString("8", comment: "")
    let optionTen = NSLocalizedString("9", comment: "")
    let optionEleven = NSLocalizedString("10", comment: "")
    let optionTwelve = NSLocalizedString("11", comment: "")
    let optionThirteen = NSLocalizedString("12", comment: "")
    let optionFourteen = NSLocalizedString("13", comment: "")
    let optionFifteen = NSLocalizedString("14", comment: "")
    let optionSixteen = NSLocalizedString("15", comment: "")
    let optionSeventeen = NSLocalizedString("15+", comment: "")

    let BSSVFrequencyOptions = [
        ORKTextChoice(text: optionOne, value: ""),
        ORKTextChoice(text: optionTwo, value: ""),
        ORKTextChoice(text: optionThree, value: ""),
        ORKTextChoice(text: optionFour, value: ""),
        ORKTextChoice(text: optionFive, value: ""),
        ORKTextChoice(text: optionSix, value: ""),
        ORKTextChoice(text: optionSeven, value: ""),
        ORKTextChoice(text: optionEight, value: ""),
        ORKTextChoice(text: optionNine, value: ""),
        ORKTextChoice(text: optionTen, value: ""),
        ORKTextChoice(text: optionEleven, value: ""),
        ORKTextChoice(text: optionTwelve, value: ""),
        ORKTextChoice(text: optionThirteen, value: ""),
        ORKTextChoice(text: optionFourteen, value: ""),
        ORKTextChoice(text: optionFifteen, value: ""),
        ORKTextChoice(text: optionSixteen, value: ""),
        ORKTextChoice(text: optionSeventeen, value: "")
    ]
    
    let BSSVFrequencyAnswerFormat = ORKAnswerFormat.valuePickerAnswerFormatWithTextChoices(BSSVFrequencyOptions)
    
    let BSSVFrequencyDrinkTitle = NSLocalizedString("How many times a day do you smoke/vape?", comment: "")
    
    let BSSVFrequencyStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSSVFrequencyStep), title: BSSVFrequencyTitle, answer: BSSVFrequencyAnswerFormat)
    
    steps += [BSSVFrequencyStep]
    
    //// Baseline SV question 2
    let BSSVSituationOptionOne = NSLocalizedString("Home", comment: "")
    let BSSVSituationOptionTwo = NSLocalizedString("Bar/Restuarant/Club", comment: "")
    let BSSVSituationOptionThree = NSLocalizedString("Party", comment: "")
    let BSSVSituationOptionFour = NSLocalizedString("Work", comment: "")
    let BSSVSituationOptionFive = NSLocalizedString("Friends' Home", comment: "")
    
    let BSSVSituationTextOptions = [
        ORKTextChoice(text: BSSVSituationOptionOne, value: ""),
        ORKTextChoice(text: BSSVSituationOptionTwo, value: ""),
        ORKTextChoice(text: BSSVSituationOptionThree, value: ""),
        ORKTextChoice(text: BSSVSituationOptionFour, value: ""),
        ORKTextChoice(text: BSSVSituationOptionFive, value: "")
    ]
    
    let BSSVSituationTitle = NSLocalizedString("Please check the situations where you tend to smoke/vape most often", comment: "")
    
    let BSSVSituationAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: BSAlcoholSituationTextOptions)
    
    let BSSVSituationStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSSVSituationStep), title: BSSVSituationTitle, answer: BSSVSituationAnswerFormat)
    steps += [BSSVSituationStep]

    //// Baseline SV question 3
    let BSSVConditionOptionOne = NSLocalizedString("Alone", comment: "")
    let BSSVConditionOptionTwo = NSLocalizedString("Family", comment: "")
    let BSSVConditionOptionThree = NSLocalizedString("Friends", comment: "")
    let BSSVConditionOptionFour = NSLocalizedString("Acquaintances", comment: "")
    let BSSVConditionOptionFive = NSLocalizedString("Co-workers", comment: "")
    
    let BSSVConditionTextOptions = [
        ORKTextChoice(text: BSSVConditionOptionOne, value: ""),
        ORKTextChoice(text: BSSVConditionOptionTwo, value: ""),
        ORKTextChoice(text: BSSVConditionOptionThree, value: ""),
        ORKTextChoice(text: BSSVConditionOptionFour, value: ""),
        ORKTextChoice(text: BSSVConditionOptionFive, value: "")
        
    ]
    
    let BSSVConditionTitle = NSLocalizedString("Who do you most often smoke/vape with?", comment: "")
    
    let BSSVConditionAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: BSSVConditionTextOptions)
    
    let BSSVConditionStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSSVConditionStep), title: BSSVConditionTitle, answer: BSSVConditionAnswerFormat)
    steps += [BSSVConditionStep]

    //// Baseline SV question 4
    let BSSVHabitAnswerFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(7, minimumValue: 1, defaultValue: NSIntegerMax, step: 1, vertical: true, maximumValueDescription: "Most are heavy smokers/vapers", minimumValueDescription: "Most do not smoke/vape at all")
    let BSSVHabitTitle = NSLocalizedString("Think about your friends and family overall. Which comes closest to the smoking/vaping habits of the people most often?", comment: "")
    let BSSVHabitStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSSVHabitStep), title: BSSVHabitTitle, answer: BSSVHabitAnswerFormat)
    
    steps += [BSSVHabitStep]

    //// Baseline SV question 5
    let BSSVDayOptionOne = NSLocalizedString("Friday", comment: "")
    let BSSVDayOptionTwo = NSLocalizedString("Saturday", comment: "")
    let BSSVDayOptionThree = NSLocalizedString("Sunday", comment: "")
    let BSSVDayOptionFour = NSLocalizedString("Monday", comment: "")
    let BSSVDayOptionFive = NSLocalizedString("Tuesday", comment: "")
    let BSSVDayOptionSix = NSLocalizedString("Wednesday", comment: "")
    let BSSVDayOptionSeven = NSLocalizedString("Thursday", comment: "")
    let BSSVDayOptionEight = NSLocalizedString("No pattern whatsoever", comment: "")
    
    
    let BSSVDayTextOptions = [
        ORKTextChoice(text: BSSVDayOptionOne, value: ""),
        ORKTextChoice(text: BSSVDayOptionTwo, value: ""),
        ORKTextChoice(text: BSSVDayOptionThree, value: ""),
        ORKTextChoice(text: BSSVDayOptionFour, value: ""),
        ORKTextChoice(text: BSSVDayOptionFive, value: ""),
        ORKTextChoice(text: BSSVDayOptionSix, value: ""),
        ORKTextChoice(text: BSSVDayOptionSeven, value: ""),
        ORKTextChoice(text: BSSVDayOptionEight, value: "")
    ]
    
    let BSSVDayTitle = NSLocalizedString("What days do you usually smoke/vape the most (if everyday, check all)?", comment: "")
    
    let BSSVDayAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices: BSSVDayTextOptions)
    
    let BSSVDayStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSSVDayStep), title: BSSVDayTitle, answer: BSSVDayAnswerFormat)
    
    steps += [BSSVDayStep]

    //// Baseline SV question 6
    let BSSVTriggerSituationOptionOne = NSLocalizedString("You are with one friend who smokes/vapes", comment: "")
    let BSSVTriggerSituationOptionTwo = NSLocalizedString("You are with a group of friends who smoke/vape", comment: "")
    let BSSVTriggerSituationOptionThree = NSLocalizedString("At an event or celebration", comment: "")
    let BSSVTriggerSituationOptionFour = NSLocalizedString("Alone in the house", comment: "")
    let BSSVTriggerSituationOptionFive = NSLocalizedString("Have a transition (e.g., train home)", comment: "")
    let BSSVTriggerSituationOptionSix = NSLocalizedString("Doing something where you usually smoke/vape (e.g., cooking, watching game)", comment: "")
    let BSSVTriggerSituationOptionSeven = NSLocalizedString("Just have cigarette in the house", comment: "")
    
    
    let BSSVTriggerSituationTextOptions = [
        ORKTextChoice(text: BSSVTriggerSituationOptionOne, value: ""),
        ORKTextChoice(text: BSSVTriggerSituationOptionTwo, value: ""),
        ORKTextChoice(text: BSSVTriggerSituationOptionThree, value: ""),
        ORKTextChoice(text: BSSVTriggerSituationOptionFour, value: ""),
        ORKTextChoice(text: BSSVTriggerSituationOptionFive, value: ""),
        ORKTextChoice(text: BSSVTriggerSituationOptionSix, value: ""),
        ORKTextChoice(text: BSSVTriggerSituationOptionSeven, value: "")
    ]
    
    let BSSVTriggerSituationTitle = NSLocalizedString("Please check up to two situations that usually trigger your to smoke/vape.", comment: "")
    
    let BSSVTriggerSituationAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices: BSSVTriggerSituationTextOptions)
    
    let BSSVTriggerSituationStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSSVTriggerSituationStep), title: BSSVTriggerSituationTitle, answer: BSSVTriggerSituationAnswerFormat)
    
    steps += [BSSVTriggerSituationStep]
    
    //// Baseline SV question 7
    let BSSVTriggerFeelingOptionOne = NSLocalizedString("To celebrate, party and have a good time", comment: "")
    let BSSVTriggerFeelingOptionTwo = NSLocalizedString("To more be social, and talkative and friendly with others", comment: "")
    let BSSVTriggerFeelingOptionThree = NSLocalizedString("To feel less anxious or stressed", comment: "")
    let BSSVTriggerFeelingOptionFour = NSLocalizedString("To unwind or relax after a long day", comment: "")
    let BSSVTriggerFeelingOptionFive = NSLocalizedString("To feel less bored", comment: "")
    let BSSVTriggerFeelingOptionSix = NSLocalizedString("To feel happier and alive", comment: "")
    let BSSVTriggerFeelingOptionSeven = NSLocalizedString("To escape or forget about problems", comment: "")
    let BSSVTriggerFeelingOptionEight = NSLocalizedString("I like the taste", comment: "")
    let BSSVTriggerFeelingOptionNine = NSLocalizedString("It is a habit and I just do it without thinking", comment: "")
    let BSSVTriggerFeelingOptionTen = NSLocalizedString("I like the whole experience/story associated with smoking/vaping", comment: "")
    
    
    let BSSVTriggerFeelingTextOptions = [
        ORKTextChoice(text: BSSVTriggerFeelingOptionOne, value: ""),
        ORKTextChoice(text: BSSVTriggerFeelingOptionTwo, value: ""),
        ORKTextChoice(text: BSSVTriggerFeelingOptionThree, value: ""),
        ORKTextChoice(text: BSSVTriggerFeelingOptionFour, value: ""),
        ORKTextChoice(text: BSSVTriggerFeelingOptionFive, value: ""),
        ORKTextChoice(text: BSSVTriggerFeelingOptionSix, value: ""),
        ORKTextChoice(text: BSSVTriggerFeelingOptionSeven, value: ""),
        ORKTextChoice(text: BSSVTriggerFeelingOptionEight, value: ""),
        ORKTextChoice(text: BSSVTriggerFeelingOptionNine, value: ""),
        ORKTextChoice(text: BSSVTriggerFeelingOptionTen, value: "")
    ]
    
    let BSSVTriggerFeelingTitle = NSLocalizedString("Please check up to three feelings that usually trigger you to smoke/vape.", comment: "")
    
    let BSSVTriggerFeelingAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices: BSSVTriggerFeelingTextOptions)
    
    let BSSVTriggerFeelingStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSSVTriggerFeelingStep), title: BSSVTriggerFeelingTitle, answer: BSSVTriggerFeelingAnswerFormat)
    
    steps += [BSSVTriggerFeelingStep]
    
    //// Baseline SV question 8
    let BSSVTypeOptionOne = NSLocalizedString("Smoke", comment: "")
    let BSSVTypeOptionTwo = NSLocalizedString("Vape", comment: "")
    let BSSVTypeOptionThree = NSLocalizedString("Chew/eat", comment: "")
    
    let BSSVTypeTextOptions = [
        ORKTextChoice(text: BSSVTypeOptionOne, value: ""),
        ORKTextChoice(text: BSSVTypeOptionTwo, value: ""),
        ORKTextChoice(text: BSSVTypeOptionThree, value: "")
    ]
    let BSSVTypeTitle = NSLocalizedString("Over the past 3 months what is your primary type of smoke/vape?", comment: "")
    
    let BSSVTypeAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: BSSVTypeTextOptions)
    
    let BSSVTypeStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSSVTypeStep), title: BSSVTypeTitle, answer: BSSVTypeAnswerFormat)
    
    steps += [BSSVTypeStep]
    
    //// Baseline SV question 9
    let BSSVSymptomOptionOne = NSLocalizedString("It would not bother me", comment: "")
    let BSSVSymptomOptionTwo = NSLocalizedString("I would feel slightly anxious or irritated", comment: "")
    let BSSVSymptomOptionThree = NSLocalizedString("My anxiety or irritation would mount, but remain manageable", comment: "")
    let BSSVSymptomOptionFour = NSLocalizedString("I would feel very anxious and irritated and have difficulty managing", comment: "")
    
    let BSSVSymptomTextOptions = [
        ORKTextChoice(text: BSSVSymptomOptionOne, value: ""),
        ORKTextChoice(text: BSSVSymptomOptionTwo, value: ""),
        ORKTextChoice(text: BSSVSymptomOptionThree, value: ""),
        ORKTextChoice(text: BSSVSymptomOptionFour, value: "")
    ]
    let BSSVSymptomTitle = NSLocalizedString("If you were prevented from smoking/vaping when you usually drink for a few days, how anxious or irritated would you feel?", comment: "")
    
    let BSSVSymptomAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: BSAlcoholSymptomTextOptions)
    
    let BSSVSymptomStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSSVSymptomStep), title: BSSVSymptomTitle, answer: BSSVSymptomAnswerFormat)
    
    steps += [BSSVSymptomStep]
    
    //// Baseline SV question 10
    let BSSVExtraInfoAnswerFormat = ORKAnswerFormat.textAnswerFormat()
    let BSSVExtraInfoTitle = NSLocalizedString("Please let us know anything about your smoking/vaping including people, situations, and feelings that we may have missed?", comment: "")
    let BSSVExtraInfoStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSSVExtraInfoStep), title: BSSVExtraInfoTitle, answer: BSSVExtraInfoAnswerFormat)
    
    steps += [BSSVExtraInfoStep]
    
    //// Baseline SV question 11
    let BSSVImportanceAnswerFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(8, minimumValue: 0, defaultValue: NSIntegerMax, step: 1, vertical: true, maximumValueDescription: "Extremely Important", minimumValueDescription: "Not at all important")
    let BSSVImportanceTitle = NSLocalizedString("How important is it for you to reduce your smoking/vaping?", comment: "")
    let BSSVImportanceStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSSVImportanceStep), title: BSSVImportanceTitle, answer: BSSVImportanceAnswerFormat)
    
    steps += [BSSVImportanceStep]
    
    /// if question 11 answer > 1
    //// Baseline SV question 12
    let BSSVConfidenceAnswerFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(8, minimumValue: 0, defaultValue: NSIntegerMax, step: 1, vertical: true, maximumValueDescription: "Extremely Confident", minimumValueDescription: "Not at all confident")
    let BSSVConfidenceTitle = NSLocalizedString("How confident are you that you can succeed in reduing your smoking/vaping?", comment: "")
    let BSSVConfidenceStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSSVConfidenceStep), title: BSSVConfidenceTitle, answer: BSSVConfidenceAnswerFormat)
    
    steps += [BSSVConfidenceStep]
    
    //// Baseline SV question 13
    let BSSVEffortAnswerFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(8, minimumValue: 0, defaultValue: NSIntegerMax, step: 1, vertical: true, maximumValueDescription: "Extremely Effort(hard)", minimumValueDescription: "No effort at all(easy)")
    let BSSVEffortTitle = NSLocalizedString("How much effort will it take to reduce your smoking/vaping in the situations you usually smoke/vape most heavily?", comment: "")
    let BSSVEffortStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSSVEffortStep), title: BSSVEffortTitle, answer: BSSVEffortAnswerFormat)
    
    steps += [BSSVEffortStep]

    //// Baseline SV question 14
    let BSSVPlanOptionOne = NSLocalizedString("Yes", comment: "")
    let BSSVPlanOptionTwo = NSLocalizedString("No", comment: "")
    
    let BSSVPlanTextOptions = [
        ORKTextChoice(text: BSSVPlanOptionOne, value: ""),
        ORKTextChoice(text: BSSVPlanOptionTwo, value: "")
    ]
    
    let BSSVPlanTitle = NSLocalizedString("Do you have a specific plan to reduce your smoking/vaping (e.g., avoid certain situations, change routines)?", comment: "")
    
    let BSSVPlanAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: BSSVPlanTextOptions)
    
    let BSSVPlanStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSSVPlanStep), title: BSSVPlanTitle, answer: BSSVPlanAnswerFormat)
    
    steps += [BSSVPlanStep]
    
    return ORKOrderedTask(identifier: String(BaselineSurveyIdentifiers.BSSVSurvey), steps: steps)

}

private var DailyAlcoholSurvey : ORKTask {
    var steps = [ORKStep]()

    //// Daily Alcohol question 1
    let optionOne = NSLocalizedString("0", comment: "")
    let optionTwo = NSLocalizedString("1", comment: "")
    let optionThree = NSLocalizedString("2", comment: "")
    let optionFour = NSLocalizedString("3", comment: "")
    let optionFive = NSLocalizedString("4", comment: "")
    let optionSix = NSLocalizedString("5", comment: "")
    let optionSeven = NSLocalizedString("6", comment: "")
    let optionEight = NSLocalizedString("7", comment: "")
    let optionNine = NSLocalizedString("8", comment: "")
    let optionTen = NSLocalizedString("9", comment: "")
    let optionEleven = NSLocalizedString("10", comment: "")
    let optionTwelve = NSLocalizedString("11", comment: "")
    let optionThirteen = NSLocalizedString("12", comment: "")
    let optionFourteen = NSLocalizedString("13", comment: "")
    let optionFifteen = NSLocalizedString("14", comment: "")
    let optionSixteen = NSLocalizedString("15", comment: "")
    let optionSeventeen = NSLocalizedString("15+", comment: "")

    
    // The text to display can be separate from the value coded for each choice:
    let DSAlcoholDrinkOptions = [
//        ORKTextChoice(text: DSAlcoholDrinkOptionOne, value: ""),
        ORKTextChoice(text: optionTwo, value: ""),
        ORKTextChoice(text: optionThree, value: ""),
        ORKTextChoice(text: optionFour, value: ""),
        ORKTextChoice(text: optionFive, value: ""),
        ORKTextChoice(text: optionSix, value: ""),
        ORKTextChoice(text: optionSeven, value: ""),
        ORKTextChoice(text: optionEight, value: ""),
        ORKTextChoice(text: optionNine, value: ""),
        ORKTextChoice(text: optionTen, value: ""),
        ORKTextChoice(text: optionEleven, value: ""),
        ORKTextChoice(text: optionTwelve, value: ""),
        ORKTextChoice(text: optionThirteen, value: ""),
        ORKTextChoice(text: optionFourteen, value: ""),
        ORKTextChoice(text: optionFifteen, value: ""),
        ORKTextChoice(text: optionSixteen, value: ""),
        ORKTextChoice(text: optionSeventeen, value: "")
    ]
    
    let DSAlcoholDrinkAnswerFormat = ORKAnswerFormat.valuePickerAnswerFormatWithTextChoices(DSAlcoholDrinkOptions)
    
    let DSAlcoholDrinkTitle = NSLocalizedString("In the last 24 hours, how many standard drinks of beer, wine or liquor did you have? Remember, a standard drink is 12 ounces of beer, 5 oz wine, 1.5 oz liquor. (Enter 0 if none).", comment: "")
    
    let DSAlcoholDrinkStep = ORKQuestionStep(identifier: String(DailySurveyIdentifiers.DSAlcoholDrinkStep), title: DSAlcoholDrinkTitle, answer: DSAlcoholDrinkAnswerFormat)
    
    steps += [DSAlcoholDrinkStep]


    //// Daily Alcohol question 2
    let DSAlcoholSituationOptionOne = NSLocalizedString("Home", comment: "")
    let DSAlcoholSituationOptionTwo = NSLocalizedString("Bar/Restuarant/Club", comment: "")
    let DSAlcoholSituationOptionThree = NSLocalizedString("Party", comment: "")
    let DSAlcoholSituationOptionFour = NSLocalizedString("Work", comment: "")
    let DSAlcoholSituationOptionFive = NSLocalizedString("Friends' Home", comment: "")
    
    let DSAlcoholSituationTextOptions = [
        ORKTextChoice(text: DSAlcoholSituationOptionOne, value: ""),
        ORKTextChoice(text: DSAlcoholSituationOptionTwo, value: ""),
        ORKTextChoice(text: DSAlcoholSituationOptionThree, value: ""),
        ORKTextChoice(text: DSAlcoholSituationOptionFour, value: ""),
        ORKTextChoice(text: DSAlcoholSituationOptionFive, value: "")
    ]
    
    let DSAlcoholSituationTitle = NSLocalizedString("Please check the situations you drank in last night.", comment: "")
    
    let DSAlcoholSituationAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: DSAlcoholSituationTextOptions)
    
    let DSAlcoholSituationStep = ORKQuestionStep(identifier: String(DailySurveyIdentifiers.DSAlcoholSituationStep), title: DSAlcoholSituationTitle, answer: DSAlcoholSituationAnswerFormat)
    
    steps += [DSAlcoholSituationStep]
    
    //// Daily Alcohol question 3
    let DSAlcoholConditionOptionOne = NSLocalizedString("Alone", comment: "")
    let DSAlcoholConditionOptionTwo = NSLocalizedString("Family", comment: "")
    let DSAlcoholConditionOptionThree = NSLocalizedString("Friends", comment: "")
    let DSAlcoholConditionOptionFour = NSLocalizedString("Acquaintances", comment: "")
    let DSAlcoholConditionOptionFive = NSLocalizedString("Co-workers", comment: "")
    
    let DSAlcoholConditionTextOptions = [
        ORKTextChoice(text: DSAlcoholConditionOptionOne, value: ""),
        ORKTextChoice(text: DSAlcoholConditionOptionTwo, value: ""),
        ORKTextChoice(text: DSAlcoholConditionOptionThree, value: ""),
        ORKTextChoice(text: DSAlcoholConditionOptionFour, value: ""),
        ORKTextChoice(text: DSAlcoholConditionOptionFive, value: "")
        
    ]
    
    let DSAlcoholConditionTitle = NSLocalizedString("Who did you drink with?", comment: "")
    
    let DSAlcoholConditionAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: DSAlcoholConditionTextOptions)
    
    let DSAlcoholConditionStep = ORKQuestionStep(identifier: String(DailySurveyIdentifiers.DSAlcoholConditionStep), title: DSAlcoholConditionTitle, answer: DSAlcoholConditionAnswerFormat)
    steps += [DSAlcoholConditionStep]
    
    //// Daily Alcohol question 4
    let DSAlcoholReasonOptionOne = NSLocalizedString("To celebrate, party and have a good time", comment: "")
    let DSAlcoholReasonOptionTwo = NSLocalizedString("To more be social, and talkative and friendly with others", comment: "")
    let DSAlcoholReasonOptionThree = NSLocalizedString("To feel less anxious or stressed", comment: "")
    let DSAlcoholReasonOptionFour = NSLocalizedString("To unwind or relax after a long day", comment: "")
    let DSAlcoholReasonOptionFive = NSLocalizedString("To feel less bored", comment: "")
    let DSAlcoholReasonOptionSix = NSLocalizedString("To feel happier and alive", comment: "")
    let DSAlcoholReasonOptionSeven = NSLocalizedString("To escape or forget about problems", comment: "")
    let DSAlcoholReasonOptionEight = NSLocalizedString("I like the taste", comment: "")
    let DSAlcoholReasonOptionNine = NSLocalizedString("It is a habit and I just do it without thinking", comment: "")
    let DSAlcoholReasonOptionTen = NSLocalizedString("I like the whole experience/story associated with drinking", comment: "")
    
    
    let DSAlcoholReasonTextOptions = [
        ORKTextChoice(text: DSAlcoholReasonOptionOne, value: ""),
        ORKTextChoice(text: DSAlcoholReasonOptionTwo, value: ""),
        ORKTextChoice(text: DSAlcoholReasonOptionThree, value: ""),
        ORKTextChoice(text: DSAlcoholReasonOptionFour, value: ""),
        ORKTextChoice(text: DSAlcoholReasonOptionFive, value: ""),
        ORKTextChoice(text: DSAlcoholReasonOptionSix, value: ""),
        ORKTextChoice(text: DSAlcoholReasonOptionSeven, value: ""),
        ORKTextChoice(text: DSAlcoholReasonOptionEight, value: ""),
        ORKTextChoice(text: DSAlcoholReasonOptionNine, value: ""),
        ORKTextChoice(text: DSAlcoholReasonOptionTen, value: "")
    ]
    
    let DSAlcoholReasonTitle = NSLocalizedString("What were the main reasons you drank last night (check all that apply)?", comment: "")
    
    let DSAlcoholReasonAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices: DSAlcoholReasonTextOptions)
    
    let DSAlcoholReasonStep = ORKQuestionStep(identifier: String(DailySurveyIdentifiers.DSAlcoholReasonStep), title: DSAlcoholReasonTitle, answer: DSAlcoholReasonAnswerFormat)
    
    steps += [DSAlcoholReasonStep]

    //// Daily Alcohol question 5
    let DSAlcoholIntentionOptionOne = NSLocalizedString("No", comment: "")
    let DSAlcoholIntentionOptionTwo = NSLocalizedString("Yes", comment: "")
    
    let DSAlcoholIntentionTextOptions = [
        ORKTextChoice(text: DSAlcoholIntentionOptionOne, value: ""),
        ORKTextChoice(text: DSAlcoholIntentionOptionTwo, value: "")
    ]
    
    let DSAlcoholIntentionTitle = NSLocalizedString("Did you intentionally try to limit your drinking last night?", comment: "")
    
    let DSAlcoholIntentionAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: DSAlcoholIntentionTextOptions)
    
    let DSAlcoholIntentionStep = ORKQuestionStep(identifier: String(DailySurveyIdentifiers.DSAlcoholIntentionStep), title: DSAlcoholIntentionTitle, answer: DSAlcoholIntentionAnswerFormat)
    
    steps += [DSAlcoholIntentionStep]
    //// Daily Alcohol question 6
    
    
    // The text to display can be separate from the value coded for each choice:
    let DSAlcoholFutureDrinkOptions = [
        ORKTextChoice(text: optionOne, value: ""),
        ORKTextChoice(text: optionTwo, value: ""),
        ORKTextChoice(text: optionThree, value: ""),
        ORKTextChoice(text: optionFour, value: ""),
        ORKTextChoice(text: optionFive, value: ""),
        ORKTextChoice(text: optionSix, value: ""),
        ORKTextChoice(text: optionSeven, value: ""),
        ORKTextChoice(text: optionEight, value: ""),
        ORKTextChoice(text: optionNine, value: ""),
        ORKTextChoice(text: optionTen, value: ""),
        ORKTextChoice(text: optionEleven, value: ""),
        ORKTextChoice(text: optionTwelve, value: ""),
        ORKTextChoice(text: optionThirteen, value: ""),
        ORKTextChoice(text: optionFourteen, value: ""),
        ORKTextChoice(text: optionFifteen, value: ""),
        ORKTextChoice(text: optionSixteen, value: ""),
        ORKTextChoice(text: optionSeventeen, value: "")
    ]
    
    let DSAlcoholFutureDrinkAnswerFormat = ORKAnswerFormat.valuePickerAnswerFormatWithTextChoices(DSAlcoholFutureDrinkOptions)
    
    let DSAlcoholFutureDrinkTitle = NSLocalizedString("How many standard drinks of beer, wine or liquor do you think you will have in the next 24 hours? Remember, a standard drink is 12 ounces of beer, 5 oz wine, 1.5 oz liquor. (Enter 0 if none).", comment: "")
    
    let DSAlcoholFutureDrinkStep = ORKQuestionStep(identifier: String(DailySurveyIdentifiers.DSAlcoholFutureDrinkStep), title: DSAlcoholFutureDrinkTitle, answer: DSAlcoholFutureDrinkAnswerFormat)
    
    steps += [DSAlcoholFutureDrinkStep]

    return ORKOrderedTask(identifier: String(DailySurveyIdentifiers.DSAlcoholSurvey), steps: steps)

}
private var DailySVSurvey: ORKTask {
    var steps = [ORKStep]()
    
    //// Daily SV question 1
    let DSSVSituationOptionOne = NSLocalizedString("Home", comment: "")
    let DSSVSituationOptionTwo = NSLocalizedString("Bar/Restuarant/Club", comment: "")
    let DSSVSituationOptionThree = NSLocalizedString("Party", comment: "")
    let DSSVSituationOptionFour = NSLocalizedString("Work", comment: "")
    let DSSVSituationOptionFive = NSLocalizedString("Friends' Home", comment: "")
    
    let DSSVSituationTextOptions = [
        ORKTextChoice(text: DSSVSituationOptionOne, value: ""),
        ORKTextChoice(text: DSSVSituationOptionTwo, value: ""),
        ORKTextChoice(text: DSSVSituationOptionThree, value: ""),
        ORKTextChoice(text: DSSVSituationOptionFour, value: ""),
        ORKTextChoice(text: DSSVSituationOptionFive, value: "")
    ]
    
    let DSSVSituationTitle = NSLocalizedString("Please check the situations you smoked/vaped in yesterday.", comment: "")
    
    let DSSVSituationAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: DSSVSituationTextOptions)
    
    let DSSVSituationStep = ORKQuestionStep(identifier: String(DailySurveyIdentifiers.DSSVSituationStep), title: DSSVSituationTitle, answer: DSSVSituationAnswerFormat)
    steps += [DSSVSituationStep]

    //// Daily SV question 2
    let DSSVConditionOptionOne = NSLocalizedString("Alone", comment: "")
    let DSSVConditionOptionTwo = NSLocalizedString("Family", comment: "")
    let DSSVConditionOptionThree = NSLocalizedString("Friends", comment: "")
    let DSSVConditionOptionFour = NSLocalizedString("Acquaintances", comment: "")
    let DSSVConditionOptionFive = NSLocalizedString("Co-workers", comment: "")
    
    let DSSVConditionTextOptions = [
        ORKTextChoice(text: DSSVConditionOptionOne, value: ""),
        ORKTextChoice(text: DSSVConditionOptionTwo, value: ""),
        ORKTextChoice(text: DSSVConditionOptionThree, value: ""),
        ORKTextChoice(text: DSSVConditionOptionFour, value: ""),
        ORKTextChoice(text: DSSVConditionOptionFive, value: "")
        
    ]
    
    let DSSVConditionTitle = NSLocalizedString("Who did you smoked/vaped with?", comment: "")
    
    let DSSVConditionAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: DSSVConditionTextOptions)
    
    let DSSVConditionStep = ORKQuestionStep(identifier: String(DailySurveyIdentifiers.DSSVConditionStep), title: DSSVConditionTitle, answer: DSSVConditionAnswerFormat)
    
    steps += [DSSVConditionStep]
    
    //// Daily SV question 3
    let DSSVReasonOptionOne = NSLocalizedString("To celebrate, party and have a good time", comment: "")
    let DSSVReasonOptionTwo = NSLocalizedString("To more be social, and talkative and friendly with others", comment: "")
    let DSSVReasonOptionThree = NSLocalizedString("To feel less anxious or stressed", comment: "")
    let DSSVReasonOptionFour = NSLocalizedString("To unwind or relax after a long day", comment: "")
    let DSSVReasonOptionFive = NSLocalizedString("To feel less bored", comment: "")
    let DSSVReasonOptionSix = NSLocalizedString("To feel happier and alive", comment: "")
    let DSSVReasonOptionSeven = NSLocalizedString("To escape or forget about problems", comment: "")
    let DSSVReasonOptionEight = NSLocalizedString("I like the taste", comment: "")
    let DSSVReasonOptionNine = NSLocalizedString("It is a habit and I just do it without thinking", comment: "")
    let DSSVReasonOptionTen = NSLocalizedString("I like the whole experience/story associated with drinking", comment: "")
    
    
    let DSSVReasonTextOptions = [
        ORKTextChoice(text: DSSVReasonOptionOne, value: ""),
        ORKTextChoice(text: DSSVReasonOptionTwo, value: ""),
        ORKTextChoice(text: DSSVReasonOptionThree, value: ""),
        ORKTextChoice(text: DSSVReasonOptionFour, value: ""),
        ORKTextChoice(text: DSSVReasonOptionFive, value: ""),
        ORKTextChoice(text: DSSVReasonOptionSix, value: ""),
        ORKTextChoice(text: DSSVReasonOptionSeven, value: ""),
        ORKTextChoice(text: DSSVReasonOptionEight, value: ""),
        ORKTextChoice(text: DSSVReasonOptionNine, value: ""),
        ORKTextChoice(text: DSSVReasonOptionTen, value: "")
    ]
    
    let DSSVReasonTitle = NSLocalizedString("What were the main reasons you smoked/vaped last night (check all that apply)?", comment: "")
    
    let DSSVReasonAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices: DSSVReasonTextOptions)
    
    let DSSVReasonStep = ORKQuestionStep(identifier: String(DailySurveyIdentifiers.DSSVReasonStep), title: DSSVReasonTitle, answer: DSSVReasonAnswerFormat)
    steps += [DSSVReasonStep]

    //// Daily SV question 4
    let DSSVIntentionOptionOne = NSLocalizedString("No", comment: "")
    let DSSVIntentionOptionTwo = NSLocalizedString("Yes", comment: "")
    
    let DSSVIntentionTextOptions = [
        ORKTextChoice(text: DSSVIntentionOptionOne, value: ""),
        ORKTextChoice(text: DSSVIntentionOptionTwo, value: "")
    ]
    
    let DSSVIntentionTitle = NSLocalizedString("Did you intentionally try to limit your smoking/vaping last night?", comment: "")
    
    let DSSVIntentionAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: DSSVIntentionTextOptions)
    
    let DSSVIntentionStep = ORKQuestionStep(identifier: String(DailySurveyIdentifiers.DSSVIntentionStep), title: DSSVIntentionTitle, answer: DSSVIntentionAnswerFormat)
    
    steps += [DSSVIntentionStep]
    
    //// Daily SV question 5
    let DSSVPlanOptionOne = NSLocalizedString("No", comment: "")
    let DSSVPlanOptionTwo = NSLocalizedString("Yes", comment: "")
    
    let DSSVPlanTextOptions = [
        ORKTextChoice(text: DSSVPlanOptionOne, value: ""),
        ORKTextChoice(text: DSSVPlanOptionTwo, value: "")
    ]
    
    let DSSVPlanTitle = NSLocalizedString("Do you plan on smoking/vaping in the next 24 hours?", comment: "")
    
    let DSSVPlanAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: DSSVPlanTextOptions)
    
    let DSSVPlanStep = ORKQuestionStep(identifier: String(DailySurveyIdentifiers.DSSVPlanStep), title: DSSVPlanTitle, answer: DSSVPlanAnswerFormat)
    
    steps += [DSSVPlanStep]

    return ORKOrderedTask(identifier: String(DailySurveyIdentifiers.DSSVSurvey), steps: steps)

}

private var EventAlcoholTask : ORKTask {
    //// Event Alcohol question 1
    let optionOne = NSLocalizedString("0", comment: "")
    let optionTwo = NSLocalizedString("1", comment: "")
    let optionThree = NSLocalizedString("2", comment: "")
    let optionFour = NSLocalizedString("3", comment: "")
    let optionFive = NSLocalizedString("4", comment: "")
    let optionSix = NSLocalizedString("5", comment: "")
    let optionSeven = NSLocalizedString("6", comment: "")
    let optionEight = NSLocalizedString("7", comment: "")
    let optionNine = NSLocalizedString("8", comment: "")
    let optionTen = NSLocalizedString("9", comment: "")
    let optionEleven = NSLocalizedString("10", comment: "")
    let optionTwelve = NSLocalizedString("11", comment: "")
    let optionThirteen = NSLocalizedString("12", comment: "")
    let optionFourteen = NSLocalizedString("13", comment: "")
    let optionFifteen = NSLocalizedString("14", comment: "")
    let optionSixteen = NSLocalizedString("15", comment: "")
    let optionSeventeen = NSLocalizedString("15+", comment: "")
    
    // The text to display can be separate from the value coded for each choice:
    let AlcoholEventDrinkOptions = [
        ORKTextChoice(text: optionOne, value: ""),
        ORKTextChoice(text: optionTwo, value: ""),
        ORKTextChoice(text: optionThree, value: ""),
        ORKTextChoice(text: optionFour, value: ""),
        ORKTextChoice(text: optionFive, value: ""),
        ORKTextChoice(text: optionSix, value: ""),
        ORKTextChoice(text: optionSeven, value: ""),
        ORKTextChoice(text: optionEight, value: ""),
        ORKTextChoice(text: optionNine, value: ""),
        ORKTextChoice(text: optionTen, value: ""),
        ORKTextChoice(text: optionEleven, value: ""),
        ORKTextChoice(text: optionTwelve, value: ""),
        ORKTextChoice(text: optionThirteen, value: ""),
        ORKTextChoice(text: optionFourteen, value: ""),
        ORKTextChoice(text: optionFifteen, value: ""),
        ORKTextChoice(text: optionSixteen, value: ""),
        ORKTextChoice(text: optionSeventeen, value: "")
        
    ]
    
    let AlcoholEventDrinkAnswerFormat = ORKAnswerFormat.valuePickerAnswerFormatWithTextChoices(AlcoholEventDrinkOptions)
    
    let AlcoholEventDrinkTitle = NSLocalizedString("How many drinks have you had already in the last 4 hours?", comment: "")
    
    let AlcoholEventDrinkStep = ORKQuestionStep(identifier: String(EventIdentifiers.AlcoholEventDrinkStep), title: AlcoholEventDrinkTitle, answer: AlcoholEventDrinkAnswerFormat)
    
    ///// Event Alcohol question 2
    let AlcoholEventIntoxicationAnswerFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(8, minimumValue: 0, defaultValue: NSIntegerMax, step: 1, vertical: true, maximumValueDescription: "Highest level of intoxication I can remember", minimumValueDescription: "Not at all intoxicated")
    let AlcoholEventIntoxicationTitle = NSLocalizedString("How intoxicated do you feel?", comment: "")
    let AlcoholEventIntoxicationStep = ORKQuestionStep(identifier: String(EventIdentifiers.AlcoholEventIntoxicationStep), title: AlcoholEventIntoxicationTitle, answer: AlcoholEventIntoxicationAnswerFormat)
    
    return ORKOrderedTask(identifier: String(EventIdentifiers.AlcoholEventSurvey), steps: [AlcoholEventDrinkStep, AlcoholEventIntoxicationStep])

}
private var EventSVTask : ORKTask {
    
    let SVEventOptionOne = NSLocalizedString("0 - 15 minutes", comment: "")
    let SVEventOptionTwo = NSLocalizedString("16 - 30 minutes", comment: "")
    let SVEventOptionThree = NSLocalizedString("30 - 60 minutes", comment: "")
    let SVEventOptionFour = NSLocalizedString("1 - 2 hours", comment: "")
    let SVEventOptionFive = NSLocalizedString("2 - 3 hours", comment: "")
    let SVEventOptionSix = NSLocalizedString("3 hours or more", comment: "")
    
    
    let SVEventTextOptions = [
        ORKTextChoice(text: SVEventOptionOne, value: ""),
        ORKTextChoice(text: SVEventOptionTwo, value: ""),
        ORKTextChoice(text: SVEventOptionThree, value: ""),
        ORKTextChoice(text: SVEventOptionFour, value: ""),
        ORKTextChoice(text: SVEventOptionFive, value: ""),
        ORKTextChoice(text: SVEventOptionSix, value: "")
    ]
    let SVEventTitle = NSLocalizedString("How long has it been since you last smoked/vaped?", comment: "")
    
    let SVEventAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: SVEventTextOptions)
    
    let SVEventStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSAlcoholSymptomStep), title: SVEventTitle, answer: SVEventAnswerFormat)

    return ORKOrderedTask(identifier: String(EventIdentifiers.SVEventSurvey), steps: [SVEventStep])
}





