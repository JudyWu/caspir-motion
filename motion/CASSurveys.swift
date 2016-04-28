///*
//Copyright (c) 2015, Apple Inc. All rights reserved.
//
//Redistribution and use in source and binary forms, with or without modification,
//are permitted provided that the following conditions are met:
//
//1.  Redistributions of source code must retain the above copyright notice, this
//list of conditions and the following disclaimer.
//
//2.  Redistributions in binary form must reproduce the above copyright notice,
//this list of conditions and the following disclaimer in the documentation and/or
//other materials provided with the distribution.
//
//3.  Neither the name of the copyright holder(s) nor the names of any contributors
//may be used to endorse or promote products derived from this software without
//specific prior written permission. No license is granted to the trademarks of
//the copyright holders even if such marks are included in this software.
//
//THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
//ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
//FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
//DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
//CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
//OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
//OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//*/
//
import ResearchKit

var onboardingTask : ORKTask {
    var steps = [ORKStep]()

    ///// Substance type question
    let substanceTypeOptionOne = NSLocalizedString("Alcohol", comment: "")
    let substanceTypeOptionTwo = NSLocalizedString("Smoke/Vape", comment: "")
    let substanceTypeOptionThree = NSLocalizedString("Both alcohol and smoke/vape", comment: "")
    
    let substanceTypeTextOptions = [
        ORKTextChoice(text: substanceTypeOptionOne, value: "Alcohol"),
        ORKTextChoice(text: substanceTypeOptionTwo, value: "Smoke/Vape"),
        ORKTextChoice(text: substanceTypeOptionThree, value: "Both")
    ]
    
    let substanceTypeTitle = NSLocalizedString("Please select the type of susbstances you have been often consuming", comment: "")
    
    let substanceTypeAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: substanceTypeTextOptions)
    
    let substanceTypeStep = ORKQuestionStep(identifier: String(OnboardingIdentifiers.SubstanceTypeStep), title: substanceTypeTitle, answer: substanceTypeAnswerFormat)
    
    substanceTypeStep.optional = false
    
    steps += [substanceTypeStep]
    
    //// Eligibility Step
    let eligibilityStepOne = ORKFormStep(identifier: String(OnboardingIdentifiers.EligibilityFormStepOne))
    eligibilityStepOne.title = NSLocalizedString("Eligibility", comment: "")
    eligibilityStepOne.optional = false
    
    let eligibilityStepTwo = ORKFormStep(identifier: String(OnboardingIdentifiers.EligibilityFormStepTwo))
    eligibilityStepTwo.title = NSLocalizedString("Eligibility", comment: "")
    eligibilityStepTwo.optional = false
    
    let eligibilityStepThree = ORKFormStep(identifier: String(OnboardingIdentifiers.EligibilityFormStepThree))
    eligibilityStepThree.title = NSLocalizedString("Eligibility", comment: "")
    eligibilityStepThree.optional = false
    
    //// All shared properties of the eligibility questions
    let textChoices : [ORKTextChoice] = [ORKTextChoice(text: "Yes", value: "Yes"), ORKTextChoice(text: "No", value: "No")]
    let textAnswerFormat = ORKTextChoiceAnswerFormat(style: ORKChoiceAnswerStyle.SingleChoice, textChoices: textChoices)
    let dayAnswerFormat = ORKNumericAnswerFormat(style: ORKNumericAnswerStyle.Integer, unit: "Days", minimum: 0, maximum: 30)
    let drinkAnswerFormat = ORKNumericAnswerFormat(style: ORKNumericAnswerStyle.Integer, unit: "Drinks", minimum: 0, maximum: 15)
    
    let formQuestion1 = "DURING THE PAST MONTH, on how many days did you have any beverage containing alcohol (including beer, wine, liquor, etc.)?"
    let formQuestion2 = "On days when you did drink alcohol DURING THE PAST MONTH, how many drinks did you usually have?"
    let formQuestion3 = "DURING THE PAST MONTH, on how many days did you have four (4) or more alcoholic drinks?"
    let formQuestion4 = "DURING THE PAST MONTH, on how many days did you have any substance containing any marijuana or cannabis substance (e.g. THC vape, edible)?"
    let formQuestion5 = "Do you have withdrawal symptoms like shaking, sweating, and/or hallucinations when you stop drinking or using for AT LEAST 24 HOURS?"
//    let formQuestion6 = "Will you be able to do survey everyday?"
    let formQuestion7 = "Are you comfortable doing tasks on the phone?"
    let formQuestion8 = "Are you comfortable getting reminders 1-2 times a day for the next 30 days. It will say, 'Please complete the IS survey. Thanks.'"
    
    let eligibilityQuestion1 = ORKFormItem(identifier: String(OnboardingIdentifiers.EligibilityFormQuestion1), text: formQuestion1, answerFormat: dayAnswerFormat)
    eligibilityQuestion1.optional = false
    
    let eligibilityQuestion2 = ORKFormItem(identifier: String(OnboardingIdentifiers.EligibilityFormQuestion2), text: formQuestion2, answerFormat: drinkAnswerFormat)
    eligibilityQuestion2.optional = false
    
    let eligibilityQuestion3 = ORKFormItem(identifier: String(OnboardingIdentifiers.EligibilityFormQuestion3), text: formQuestion3, answerFormat: dayAnswerFormat)
    eligibilityQuestion3.optional = false
    
    let eligibilityQuestion4 = ORKFormItem(identifier: String(OnboardingIdentifiers.EligibilityFormQuestion4), text: formQuestion4, answerFormat: dayAnswerFormat)
    eligibilityQuestion4.optional = false
    
    let eligibilityQuestion5 = ORKFormItem(identifier: String(OnboardingIdentifiers.EligibilityFormQuestion5), text: formQuestion5 , answerFormat: textAnswerFormat)
    eligibilityQuestion5.optional = false
    
//    let eligibilityQuestion6 = ORKFormItem(identifier: String(OnboardingIdentifiers.EligibilityFormQuestion6), text: formQuestion6, answerFormat: textAnswerFormat)
//    eligibilityQuestion6.optional = false
    
    let eligibilityQuestion7 = ORKFormItem(identifier: String(OnboardingIdentifiers.EligibilityFormQuestion7), text: formQuestion7, answerFormat: textAnswerFormat)
    eligibilityQuestion7.optional = false
    
    let eligibilityQuestion8 = ORKFormItem(identifier: String(OnboardingIdentifiers.EligibilityFormQuestion8), text: formQuestion8, answerFormat: textAnswerFormat)
    eligibilityQuestion8.optional = false
    
    
    eligibilityStepOne.formItems = [
        eligibilityQuestion1,
        eligibilityQuestion2,
        eligibilityQuestion3,
        eligibilityQuestion5,
//        eligibilityQuestion6,
        eligibilityQuestion7,
        eligibilityQuestion8
    ]
    steps += [eligibilityStepOne]
    //
    //
    eligibilityStepTwo.formItems = [
        eligibilityQuestion4,
//        eligibilityQuestion6,
        eligibilityQuestion7,
        eligibilityQuestion8
    ]
    steps += [eligibilityStepTwo]
    
    eligibilityStepThree.formItems = [
        eligibilityQuestion1,
        eligibilityQuestion2,
        eligibilityQuestion3,
        eligibilityQuestion4,
        eligibilityQuestion5,
//        eligibilityQuestion6,
        eligibilityQuestion7,
        eligibilityQuestion8
    ]
    steps += [eligibilityStepThree]
    
//    let ineligibleStep = IneligibleStep(identifier: String(OnboardingIdentifiers.IneligibleStep))
    let ineligibleStep = ORKInstructionStep(identifier: String(OnboardingIdentifiers.IneligibleStep))
    ineligibleStep.title = "Sorry, you are ineligible"
    ineligibleStep.detailText = "If you would like to get more information, please visit caspir.org or email us at caspir@northwell.edu to find more help."
    steps += [ineligibleStep]

    let eligibleStep = ORKInstructionStep(identifier: String(OnboardingIdentifiers.EligibleStep))
    eligibleStep.title = "You are eligible"
    eligibleStep.text = "Please complete the following consent form on the web."
    
    steps += [eligibleStep]
    ////fsdjflsdjflksdslsklfsdfjdslkf
    var resultSelector = ORKResultSelector(resultIdentifier: String(OnboardingIdentifiers.SubstanceTypeStep))
    //
    let predicateSubstanceAlcohol = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(resultSelector, expectedAnswerValue: "Alcohol")
    //
    let predicateSubstanceSV = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(resultSelector, expectedAnswerValue: "Smoke/Vape")
    //
    let predicateSubstanceBoth = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(resultSelector, expectedAnswerValue: "Both")
    //
    let predicateEligibilityRule = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [ (predicateSubstanceAlcohol, String(OnboardingIdentifiers.EligibilityFormStepOne)), (predicateSubstanceSV, String(OnboardingIdentifiers.EligibilityFormStepTwo)), (predicateSubstanceBoth, String(OnboardingIdentifiers.EligibilityFormStepThree))])
    //
    
    //Build navigation rules for eligible/ineligible pages
    ///// Eligibility Alcohol
    resultSelector = ORKResultSelector(stepIdentifier: String(OnboardingIdentifiers.EligibilityFormStepOne), resultIdentifier: String(OnboardingIdentifiers.EligibilityFormQuestion1))
    
    let predicateOneItem01 = ORKResultPredicate.predicateForNumericQuestionResultWithResultSelector(resultSelector, minimumExpectedAnswerValue: 8.0)
    
    resultSelector = ORKResultSelector(stepIdentifier: String(OnboardingIdentifiers.EligibilityFormStepOne), resultIdentifier: String(OnboardingIdentifiers.EligibilityFormQuestion2))
    let predicateOneItem02 = ORKResultPredicate.predicateForNumericQuestionResultWithResultSelector(resultSelector, minimumExpectedAnswerValue: 2.0)
    
    resultSelector = ORKResultSelector(stepIdentifier: String(OnboardingIdentifiers.EligibilityFormStepOne), resultIdentifier: String(OnboardingIdentifiers.EligibilityFormQuestion3))
    let predicateOneItem03 = ORKResultPredicate.predicateForNumericQuestionResultWithResultSelector(resultSelector, minimumExpectedAnswerValue: 2.0)
    
    
    resultSelector = ORKResultSelector(stepIdentifier: String(OnboardingIdentifiers.EligibilityFormStepOne), resultIdentifier: String(OnboardingIdentifiers.EligibilityFormQuestion5))
    
    let predicateOneItem05 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(resultSelector, expectedAnswerValue: "No")
    
    
    resultSelector = ORKResultSelector(stepIdentifier: String(OnboardingIdentifiers.EligibilityFormStepOne), resultIdentifier: String(OnboardingIdentifiers.EligibilityFormQuestion7))
    let predicateOneItem07 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(resultSelector, expectedAnswerValue: "Yes")
    
    resultSelector = ORKResultSelector(stepIdentifier: String(OnboardingIdentifiers.EligibilityFormStepOne), resultIdentifier: String(OnboardingIdentifiers.EligibilityFormQuestion8))
    let predicateOneItem08 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(resultSelector, expectedAnswerValue: "Yes")
    
    //// Eligibility SV
    resultSelector = ORKResultSelector(stepIdentifier: String(OnboardingIdentifiers.EligibilityFormStepTwo), resultIdentifier: String(OnboardingIdentifiers.EligibilityFormQuestion4))
    let predicateTwoItem04 = ORKResultPredicate.predicateForNumericQuestionResultWithResultSelector(resultSelector, minimumExpectedAnswerValue: 8.0)
    
    resultSelector = ORKResultSelector(stepIdentifier: String(OnboardingIdentifiers.EligibilityFormStepTwo), resultIdentifier: String(OnboardingIdentifiers.EligibilityFormQuestion7))
    let predicateTwoItem07 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(resultSelector, expectedAnswerValue: "Yes")
    
    resultSelector = ORKResultSelector(stepIdentifier: String(OnboardingIdentifiers.EligibilityFormStepTwo), resultIdentifier: String(OnboardingIdentifiers.EligibilityFormQuestion8))
    let predicateTwoItem08 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(resultSelector, expectedAnswerValue: "Yes")
    
    
    ////// Eligibility Both
    resultSelector = ORKResultSelector(stepIdentifier: String(OnboardingIdentifiers.EligibilityFormStepThree), resultIdentifier: String(OnboardingIdentifiers.EligibilityFormQuestion1))
    
    let predicateThreeItem01 = ORKResultPredicate.predicateForNumericQuestionResultWithResultSelector(resultSelector, minimumExpectedAnswerValue: 8.0)
    
    resultSelector = ORKResultSelector(stepIdentifier: String(OnboardingIdentifiers.EligibilityFormStepThree), resultIdentifier: String(OnboardingIdentifiers.EligibilityFormQuestion2))
    let predicateThreeItem02 = ORKResultPredicate.predicateForNumericQuestionResultWithResultSelector(resultSelector, minimumExpectedAnswerValue: 2.0)
    
    resultSelector = ORKResultSelector(stepIdentifier: String(OnboardingIdentifiers.EligibilityFormStepThree), resultIdentifier: String(OnboardingIdentifiers.EligibilityFormQuestion3))
    let predicateThreeItem03 = ORKResultPredicate.predicateForNumericQuestionResultWithResultSelector(resultSelector, minimumExpectedAnswerValue: 2.0)
    
    resultSelector = ORKResultSelector(stepIdentifier: String(OnboardingIdentifiers.EligibilityFormStepThree), resultIdentifier: String(OnboardingIdentifiers.EligibilityFormQuestion4))
    let predicateThreeItem04 = ORKResultPredicate.predicateForNumericQuestionResultWithResultSelector(resultSelector, minimumExpectedAnswerValue: 8.0)
    
    resultSelector = ORKResultSelector(stepIdentifier: String(OnboardingIdentifiers.EligibilityFormStepThree), resultIdentifier: String(OnboardingIdentifiers.EligibilityFormQuestion5))
    
    let predicateThreeItem05 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(resultSelector, expectedAnswerValue: "No")
    
    resultSelector = ORKResultSelector(stepIdentifier: String(OnboardingIdentifiers.EligibilityFormStepThree), resultIdentifier: String(OnboardingIdentifiers.EligibilityFormQuestion7))
    let predicateThreeItem07 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(resultSelector, expectedAnswerValue: "Yes")
    
    resultSelector = ORKResultSelector(stepIdentifier: String(OnboardingIdentifiers.EligibilityFormStepThree), resultIdentifier: String(OnboardingIdentifiers.EligibilityFormQuestion8))
    let predicateThreeItem08 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(resultSelector, expectedAnswerValue: "Yes")
    
    
    let predicateEligibleOne = NSCompoundPredicate(andPredicateWithSubpredicates: [predicateOneItem01, predicateOneItem02, predicateOneItem03, predicateOneItem05, predicateOneItem07, predicateOneItem08])
    
    let predicateEligibleTwo = NSCompoundPredicate(andPredicateWithSubpredicates: [predicateTwoItem04, predicateTwoItem07, predicateTwoItem08])
    
    let predicateEligibleThree = NSCompoundPredicate(andPredicateWithSubpredicates: [predicateThreeItem01, predicateThreeItem02, predicateThreeItem03, predicateThreeItem04, predicateThreeItem05, predicateThreeItem07, predicateThreeItem08])
    
    
    let predicateEligibilityAlcoholRule = ORKPredicateStepNavigationRule(resultPredicates: [predicateEligibleOne], destinationStepIdentifiers: [String(OnboardingIdentifiers.EligibleStep)], defaultStepIdentifier: String(OnboardingIdentifiers.IneligibleStep), validateArrays: true)
    
    let predicateEligibilitySVRule = ORKPredicateStepNavigationRule(resultPredicates: [predicateEligibleTwo], destinationStepIdentifiers: [String(OnboardingIdentifiers.EligibleStep)], defaultStepIdentifier: String(OnboardingIdentifiers.IneligibleStep), validateArrays: true)
    
    let predicateEligibilityBothRule = ORKPredicateStepNavigationRule(resultPredicates: [predicateEligibleThree], destinationStepIdentifiers: [String(OnboardingIdentifiers.EligibleStep)], defaultStepIdentifier: String(OnboardingIdentifiers.IneligibleStep), validateArrays: true)
    
    //// Consent Step
    let consentStep = ConsentStep(identifier: String(OnboardingIdentifiers.VisualConsentStep))
    
    steps += [consentStep]
    
    
    //// Code Step
    let codeTitle = NSLocalizedString("Please enter your unique code", comment: "")
    let codeAnswerFormat =  ORKAnswerFormat.textAnswerFormat()
    
    /// Set the regex for the passcode
    codeAnswerFormat.maximumLength = 7
    codeAnswerFormat.validationRegex = "^[A-Z][0-9][a-z][%*$][0-9][A-Z][a-z]$"
    codeAnswerFormat.invalidMessage = "Please check your passcode again"

    codeAnswerFormat.secureTextEntry = true
    codeAnswerFormat.spellCheckingType = UITextSpellCheckingType.No
    codeAnswerFormat.autocorrectionType = UITextAutocorrectionType.No
    codeAnswerFormat.autocapitalizationType = UITextAutocapitalizationType.None
    codeAnswerFormat.multipleLines = false
    
    let codeItem : ORKFormItem = ORKFormItem(identifier: String(OtherTasksIdentifiers.LogInItem), text: "Passcode", answerFormat: codeAnswerFormat, optional: false)
    codeItem.placeholder = "Passcode from the consent form"
    let codeText = "Please enter your passcode"
    let codeStep = ORKFormStep(identifier: String(OnboardingIdentifiers.RegistrationStep), title: codeTitle, text: codeText)
    codeStep.optional = false
    codeStep.formItems = [codeItem]
    codeStep.optional = false

    steps += [codeStep]
    
    // Add authorizationt to HealthKit
    let healthDataStep = HealthDataStep(identifier: String(OnboardingIdentifiers.HealthStep))
    
    steps += [healthDataStep]
    
    let passcodeStep = ORKPasscodeStep(identifier: String(OnboardingIdentifiers.PasscodeStep))
    passcodeStep.text = "Now you will create a passcode to identify yourself to the app and protect access to information you've entered."
    
    steps += [passcodeStep]
    
    let completionStep = ORKCompletionStep(identifier: String(OnboardingIdentifiers.CompletionStep))
    completionStep.title = "Welcome aboard."
    completionStep.text = "Thank you for joining this study."
    steps += [completionStep]
    
    let onboardingTask = ORKNavigableOrderedTask(identifier: String(OnboardingIdentifiers.OnboardingTask), steps: steps)
    
    onboardingTask.setNavigationRule(predicateEligibilityRule, forTriggerStepIdentifier: String(OnboardingIdentifiers.SubstanceTypeStep))
    
    onboardingTask.setNavigationRule(predicateEligibilityAlcoholRule, forTriggerStepIdentifier: String(OnboardingIdentifiers.EligibilityFormStepOne))
    onboardingTask.setNavigationRule(predicateEligibilitySVRule, forTriggerStepIdentifier: String(OnboardingIdentifiers.EligibilityFormStepTwo))
    onboardingTask.setNavigationRule(predicateEligibilityBothRule, forTriggerStepIdentifier: String(OnboardingIdentifiers.EligibilityFormStepThree))
    let directRule = ORKDirectStepNavigationRule(destinationStepIdentifier: ORKNullStepIdentifier)
    
    onboardingTask.setNavigationRule(directRule, forTriggerStepIdentifier: String(OnboardingIdentifiers.IneligibleStep))
    
    return onboardingTask
}

var baselineAlcoholSurvey : ORKTask {
    var steps = [ORKStep]()
    
    ///// BS Alcohol question 1
    let BSAlcoholSituationOptionOne = NSLocalizedString("Home", comment: "")
    let BSAlcoholSituationOptionTwo = NSLocalizedString("Bar/Restuarant/Club", comment: "")
    let BSAlcoholSituationOptionThree = NSLocalizedString("Party", comment: "")
    let BSAlcoholSituationOptionFour = NSLocalizedString("Work", comment: "")
    let BSAlcoholSituationOptionFive = NSLocalizedString("Friends' Home", comment: "")
    let BSAlcoholSituationOptionSix = NSLocalizedString("Other", comment: "")
    
    let BSAlcoholSituationTextOptions = [
        ORKTextChoice(text: BSAlcoholSituationOptionOne, value: 1),
        ORKTextChoice(text: BSAlcoholSituationOptionTwo, value: 3),
        ORKTextChoice(text: BSAlcoholSituationOptionThree, value: 7),
        ORKTextChoice(text: BSAlcoholSituationOptionFour, value: 4),
        ORKTextChoice(text: BSAlcoholSituationOptionFive, value: 2),
        ORKTextChoice(text: BSAlcoholSituationOptionSix, value: 99)
    ]
    
    let BSAlcoholSituationTitle = NSLocalizedString("Please check the situations where you tend drink most often", comment: "")
    
    let BSAlcoholSituationAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices: BSAlcoholSituationTextOptions)
    
    let BSAlcoholSituationStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSAlcoholSituationStep), title: BSAlcoholSituationTitle, answer: BSAlcoholSituationAnswerFormat)
    steps += [BSAlcoholSituationStep]
    
    ///// BS Alcohol question 2
    let BSAlcoholConditionOptionOne = NSLocalizedString("Alone", comment: "")
    let BSAlcoholConditionOptionTwo = NSLocalizedString("Family", comment: "")
    let BSAlcoholConditionOptionThree = NSLocalizedString("Friends", comment: "")
    let BSAlcoholConditionOptionFour = NSLocalizedString("Acquaintances", comment: "")
    let BSAlcoholConditionOptionFive = NSLocalizedString("Co-workers", comment: "")
    
    let BSAlcoholConditionTextOptions = [
        ORKTextChoice(text: BSAlcoholConditionOptionOne, value: 1),
        ORKTextChoice(text: BSAlcoholConditionOptionTwo, value: 2),
        ORKTextChoice(text: BSAlcoholConditionOptionThree, value: 3),
        ORKTextChoice(text: BSAlcoholConditionOptionFour, value: 7),
        ORKTextChoice(text: BSAlcoholConditionOptionFive, value: 4)
        
    ]
    
    let BSAlcoholConditionTitle = NSLocalizedString("Who do you most often drink with?", comment: "")
    
    let BSAlcoholConditionAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices: BSAlcoholConditionTextOptions)
    
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
        ORKTextChoice(text: BSAlcoholDayOptionOne, value: 6),
        ORKTextChoice(text: BSAlcoholDayOptionTwo, value: 7),
        ORKTextChoice(text: BSAlcoholDayOptionThree, value: 1),
        ORKTextChoice(text: BSAlcoholDayOptionFour, value: 2),
        ORKTextChoice(text: BSAlcoholDayOptionFive, value: 3),
        ORKTextChoice(text: BSAlcoholDayOptionSix, value: 4),
        ORKTextChoice(text: BSAlcoholDayOptionSeven, value: 5),
        ORKTextChoice(text: BSAlcoholDayOptionEight, value: 8)
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
        ORKTextChoice(text: BSAlcoholTriggerSituationOptionOne, value: 1),
        ORKTextChoice(text: BSAlcoholTriggerSituationOptionTwo, value: 2),
        ORKTextChoice(text: BSAlcoholTriggerSituationOptionThree, value: 3),
        ORKTextChoice(text: BSAlcoholTriggerSituationOptionFour, value: 4),
        ORKTextChoice(text: BSAlcoholTriggerSituationOptionFive, value: 5),
        ORKTextChoice(text: BSAlcoholTriggerSituationOptionSix, value: 6),
        ORKTextChoice(text: BSAlcoholTriggerSituationOptionSeven, value: 7)
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
    let BSAlcoholTriggerFeelingOptionEleven = NSLocalizedString("Someone asks me to  a have a drink", comment: "")
    
    
    let BSAlcoholTriggerFeelingTextOptions = [
        ORKTextChoice(text: BSAlcoholTriggerFeelingOptionOne, value: 1),
        ORKTextChoice(text: BSAlcoholTriggerFeelingOptionTwo, value: 2),
        ORKTextChoice(text: BSAlcoholTriggerFeelingOptionThree, value: 3),
        ORKTextChoice(text: BSAlcoholTriggerFeelingOptionFour, value: 4),
        ORKTextChoice(text: BSAlcoholTriggerFeelingOptionFive, value: 5),
        ORKTextChoice(text: BSAlcoholTriggerFeelingOptionSix, value: 6),
        ORKTextChoice(text: BSAlcoholTriggerFeelingOptionSeven, value: 7),
        ORKTextChoice(text: BSAlcoholTriggerFeelingOptionEight, value: 8),
        ORKTextChoice(text: BSAlcoholTriggerFeelingOptionNine, value: 9),
        ORKTextChoice(text: BSAlcoholTriggerFeelingOptionTen, value: 10),
        ORKTextChoice(text: BSAlcoholTriggerFeelingOptionEleven, value: 11)
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
        ORKTextChoice(text: BSAlcoholTypeOptionOne, value: 1),
        ORKTextChoice(text: BSAlcoholTypeOptionTwo, value: 2),
        ORKTextChoice(text: BSAlcoholTypeOptionThree, value: 3)
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
        ORKTextChoice(text: BSAlcoholSymptomOptionOne, value: 1),
        ORKTextChoice(text: BSAlcoholSymptomOptionTwo, value: 2),
        ORKTextChoice(text: BSAlcoholSymptomOptionThree, value: 3),
        ORKTextChoice(text: BSAlcoholSymptomOptionFour, value: 4)
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
    
    //// BS Alcohol completion step when question 10 is less than 2
//    let BSAlcoholCompletionStepOne = ORKCompletionStep(identifier: String(BaselineSurveyIdentifiers.BSAlcoholCompletionStepOne))
//    BSAlcoholCompletionStepOne.detailText = NSLocalizedString("Thank you for completing the Baseline Alcohol survey", comment: "")
//    
//    steps += [BSAlcoholCompletionStepOne]
    
    ///// Condition for question 10
    let BSAlcoholImportanceResultSelector = ORKResultSelector(resultIdentifier: String(BaselineSurveyIdentifiers.BSAlcoholImportanceStep))
    
    let BSAlcoholImportancePredicate = ORKResultPredicate.predicateForScaleQuestionResultWithResultSelector(BSAlcoholImportanceResultSelector, minimumExpectedAnswerValue: 2.0)
    
    let predicateRule = ORKPredicateStepNavigationRule(resultPredicates: [BSAlcoholImportancePredicate], destinationStepIdentifiers: [String(BaselineSurveyIdentifiers.BSAlcoholConfidenceStep)], defaultStepIdentifier: String(BaselineSurveyIdentifiers.BSAlcoholCompletionStep), validateArrays: true)
    
//    let predicateRule = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [ (BSAlcoholImportancePredicate, String(BaselineSurveyIdentifiers.BSAlcoholConfidenceStep))])
    
    let directRule = ORKDirectStepNavigationRule(destinationStepIdentifier: ORKNullStepIdentifier)
    
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
    //// BS alcohol completion step when question 10 is bigger than 2
    
    let BSAlcoholCompletionStep = ORKCompletionStep(identifier: String(BaselineSurveyIdentifiers.BSAlcoholCompletionStep))
    BSAlcoholCompletionStep.detailText = NSLocalizedString("Thank you for completing the Baseline Alcohol survey", comment: "")
    
    steps += [BSAlcoholCompletionStep]
    
    
    let BSAlcoholSurvey = ORKNavigableOrderedTask(identifier: String(BaselineSurveyIdentifiers.BSAlcoholSurvey), steps: steps)
    
    BSAlcoholSurvey.setNavigationRule(predicateRule, forTriggerStepIdentifier: String(BaselineSurveyIdentifiers.BSAlcoholImportanceStep))
    
    BSAlcoholSurvey.setNavigationRule(directRule, forTriggerStepIdentifier: String(BaselineSurveyIdentifiers.BSAlcoholCompletionStep))
    
    return BSAlcoholSurvey
}
var baselineSVSurvey : ORKTask {
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
        ORKTextChoice(text: optionOne, value: 0),
        ORKTextChoice(text: optionTwo, value: 1),
        ORKTextChoice(text: optionThree, value: 2),
        ORKTextChoice(text: optionFour, value: 3),
        ORKTextChoice(text: optionFive, value: 4),
        ORKTextChoice(text: optionSix, value: 5),
        ORKTextChoice(text: optionSeven, value: 6),
        ORKTextChoice(text: optionEight, value: 7),
        ORKTextChoice(text: optionNine, value: 8),
        ORKTextChoice(text: optionTen, value: 9),
        ORKTextChoice(text: optionEleven, value: 10),
        ORKTextChoice(text: optionTwelve, value: 11),
        ORKTextChoice(text: optionThirteen, value: 12),
        ORKTextChoice(text: optionFourteen, value: 13),
        ORKTextChoice(text: optionFifteen, value: 14),
        ORKTextChoice(text: optionSixteen, value: 15),
        ORKTextChoice(text: optionSeventeen, value: 16)
    ]
    
    let BSSVFrequencyAnswerFormat = ORKAnswerFormat.valuePickerAnswerFormatWithTextChoices(BSSVFrequencyOptions)
    
    let BSSVFrequencyTitle = NSLocalizedString("How many times a day do you smoke/vape?", comment: "")
    
    let BSSVFrequencyStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSSVFrequencyStep), title: BSSVFrequencyTitle, answer: BSSVFrequencyAnswerFormat)
    
    steps += [BSSVFrequencyStep]
    
    //// Baseline SV question 2
    let BSSVSituationOptionOne = NSLocalizedString("Home", comment: "")
    let BSSVSituationOptionTwo = NSLocalizedString("Bar/Restuarant/Club", comment: "")
    let BSSVSituationOptionThree = NSLocalizedString("Party", comment: "")
    let BSSVSituationOptionFour = NSLocalizedString("Work", comment: "")
    let BSSVSituationOptionFive = NSLocalizedString("Friends' Home", comment: "")
    let BSSVSituationOptionSix = NSLocalizedString("Other", comment: "")

    
    let BSSVSituationTextOptions = [
        ORKTextChoice(text: BSSVSituationOptionOne, value: 1),
        ORKTextChoice(text: BSSVSituationOptionTwo, value: 3),
        ORKTextChoice(text: BSSVSituationOptionThree, value: 7),
        ORKTextChoice(text: BSSVSituationOptionFour, value: 4),
        ORKTextChoice(text: BSSVSituationOptionFive, value: 2),
        ORKTextChoice(text: BSSVSituationOptionSix, value: 99)
    ]
    
    let BSSVSituationTitle = NSLocalizedString("Please check the situations where you tend to smoke/vape most often", comment: "")
    
    let BSSVSituationAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices: BSSVSituationTextOptions)
    
    let BSSVSituationStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSSVSituationStep), title: BSSVSituationTitle, answer: BSSVSituationAnswerFormat)
    steps += [BSSVSituationStep]
    
    //// Baseline SV question 3
    let BSSVConditionOptionOne = NSLocalizedString("Alone", comment: "")
    let BSSVConditionOptionTwo = NSLocalizedString("Family", comment: "")
    let BSSVConditionOptionThree = NSLocalizedString("Friends", comment: "")
    let BSSVConditionOptionFour = NSLocalizedString("Acquaintances", comment: "")
    let BSSVConditionOptionFive = NSLocalizedString("Co-workers", comment: "")
    
    let BSSVConditionTextOptions = [
        ORKTextChoice(text: BSSVConditionOptionOne, value: 1),
        ORKTextChoice(text: BSSVConditionOptionTwo, value: 2),
        ORKTextChoice(text: BSSVConditionOptionThree, value: 3),
        ORKTextChoice(text: BSSVConditionOptionFour, value: 7),
        ORKTextChoice(text: BSSVConditionOptionFive, value: 4)
        
    ]
    
    let BSSVConditionTitle = NSLocalizedString("Who do you most often smoke/vape with?", comment: "")
    
    let BSSVConditionAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices: BSSVConditionTextOptions)
    
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
        ORKTextChoice(text: BSSVDayOptionOne, value: 6),
        ORKTextChoice(text: BSSVDayOptionTwo, value: 7),
        ORKTextChoice(text: BSSVDayOptionThree, value: 1),
        ORKTextChoice(text: BSSVDayOptionFour, value: 2),
        ORKTextChoice(text: BSSVDayOptionFive, value:3),
        ORKTextChoice(text: BSSVDayOptionSix, value: 4),
        ORKTextChoice(text: BSSVDayOptionSeven, value: 5),
        ORKTextChoice(text: BSSVDayOptionEight, value: 8)
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
//    let BSSVTriggerSituationOptionFive = NSLocalizedString("Have a transition (e.g., train home)", comment: "")
    let BSSVTriggerSituationOptionSix = NSLocalizedString("Doing something where you usually smoke/vape (e.g., cooking, watching game)", comment: "")
    let BSSVTriggerSituationOptionSeven = NSLocalizedString("Just have it in the house", comment: "")
    
    
    let BSSVTriggerSituationTextOptions = [
        ORKTextChoice(text: BSSVTriggerSituationOptionOne, value: 1),
        ORKTextChoice(text: BSSVTriggerSituationOptionTwo, value: 2),
        ORKTextChoice(text: BSSVTriggerSituationOptionThree, value: 3),
        ORKTextChoice(text: BSSVTriggerSituationOptionFour, value: 4),
//        ORKTextChoice(text: BSSVTriggerSituationOptionFive, value: ""),
        ORKTextChoice(text: BSSVTriggerSituationOptionSix, value: 6),
        ORKTextChoice(text: BSSVTriggerSituationOptionSeven, value: 6)
    ]
    
    let BSSVTriggerSituationTitle = NSLocalizedString("Please check up to two situations that usually trigger your to smoke/vape.", comment: "")
    
    let BSSVTriggerSituationAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices: BSSVTriggerSituationTextOptions)
    
    let BSSVTriggerSituationStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSSVTriggerSituationStep), title: BSSVTriggerSituationTitle, answer: BSSVTriggerSituationAnswerFormat)
    
    steps += [BSSVTriggerSituationStep]
    
    //// Baseline SV question 7
    let BSSVTriggerFeelingOptionOne = NSLocalizedString("To celebrate, party and have a good time", comment: "")
    let BSSVTriggerFeelingOptionTwo = NSLocalizedString(" To more be friendly with others", comment: "")
    let BSSVTriggerFeelingOptionThree = NSLocalizedString("To feel less anxious or stressed", comment: "")
    let BSSVTriggerFeelingOptionFour = NSLocalizedString("To unwind or relax after a long day", comment: "")
    let BSSVTriggerFeelingOptionFive = NSLocalizedString("To feel less bored", comment: "")
    let BSSVTriggerFeelingOptionSix = NSLocalizedString("To feel happier and alive", comment: "")
    let BSSVTriggerFeelingOptionSeven = NSLocalizedString("To escape or forget about problems", comment: "")
    let BSSVTriggerFeelingOptionEight = NSLocalizedString("I like the taste", comment: "")
    let BSSVTriggerFeelingOptionNine = NSLocalizedString("It is a habit and I just do it without thinking", comment: "")
    let BSSVTriggerFeelingOptionTen = NSLocalizedString("I like the whole experience/story associated with smoking/vaping", comment: "")
    let BSSVTriggerFeelingOptionEleven = NSLocalizedString("Someone offered it to me", comment: "")
    let BSSVTriggerFeelingOptionTwelve = NSLocalizedString("To get through the day", comment: "")
    let BSSVTriggerFeelingOptionThirteen = NSLocalizedString("I wanted to just feel high", comment: "")
    
    let BSSVTriggerFeelingTextOptions = [
        ORKTextChoice(text: BSSVTriggerFeelingOptionOne, value: 1),
        ORKTextChoice(text: BSSVTriggerFeelingOptionTwo, value: 2),
        ORKTextChoice(text: BSSVTriggerFeelingOptionThree, value: 3),
        ORKTextChoice(text: BSSVTriggerFeelingOptionFour, value: 4),
        ORKTextChoice(text: BSSVTriggerFeelingOptionFive, value: 5),
        ORKTextChoice(text: BSSVTriggerFeelingOptionSix, value: 6),
        ORKTextChoice(text: BSSVTriggerFeelingOptionSeven, value: 7),
        ORKTextChoice(text: BSSVTriggerFeelingOptionEight, value: 8),
        ORKTextChoice(text: BSSVTriggerFeelingOptionNine, value: 9),
        ORKTextChoice(text: BSSVTriggerFeelingOptionTen, value: 10),
        ORKTextChoice(text: BSSVTriggerFeelingOptionEleven, value: 11),
        ORKTextChoice(text: BSSVTriggerFeelingOptionTwelve, value: 12),
        ORKTextChoice(text: BSSVTriggerFeelingOptionThirteen, value: 13)
        
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
        ORKTextChoice(text: BSSVTypeOptionOne, value: 1),
        ORKTextChoice(text: BSSVTypeOptionTwo, value: 2),
        ORKTextChoice(text: BSSVTypeOptionThree, value: 3)
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
        ORKTextChoice(text: BSSVSymptomOptionOne, value: 1),
        ORKTextChoice(text: BSSVSymptomOptionTwo, value: 2),
        ORKTextChoice(text: BSSVSymptomOptionThree, value: 3),
        ORKTextChoice(text: BSSVSymptomOptionFour, value: 4)
    ]
    let BSSVSymptomTitle = NSLocalizedString("If you were prevented from smoking/vaping when you usually drink for a few days, how anxious or irritated would you feel?", comment: "")
    
    let BSSVSymptomAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: BSSVSymptomTextOptions)
    
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
    
    //// BS Smoke/Vape completion step when question 10 is less than 2
    let BSSVCompletionStepOne = ORKCompletionStep(identifier: String(BaselineSurveyIdentifiers.BSSVCompletionStepOne))
    BSSVCompletionStepOne.detailText = NSLocalizedString("Thank you for completing the Baseline Smoke/Vape survey", comment: "")
    
    steps += [BSSVCompletionStepOne]
    
    ///// Condition for question 10
    let BSSVImportanceResultSelector = ORKResultSelector(resultIdentifier: String(BaselineSurveyIdentifiers.BSSVImportanceStep))
    
    let BSSVImportancePredicate = ORKResultPredicate.predicateForScaleQuestionResultWithResultSelector(BSSVImportanceResultSelector, minimumExpectedAnswerValue: 2.0)
    
    let predicateRule = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [ (BSSVImportancePredicate, String(BaselineSurveyIdentifiers.BSSVConfidenceStep))])
    
    let directRule = ORKDirectStepNavigationRule(destinationStepIdentifier: ORKNullStepIdentifier)
    
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
        ORKTextChoice(text: BSSVPlanOptionOne, value: "Yes"),
        ORKTextChoice(text: BSSVPlanOptionTwo, value: "No")
    ]
    
    let BSSVPlanTitle = NSLocalizedString("Do you have a specific plan to reduce your smoking/vaping (e.g., avoid certain situations, change routines)?", comment: "")
    
    let BSSVPlanAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: BSSVPlanTextOptions)
    
    let BSSVPlanStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSSVPlanStep), title: BSSVPlanTitle, answer: BSSVPlanAnswerFormat)
    
    steps += [BSSVPlanStep]
    
    //// BS alcohol completion step when question 10 is bigger than 2
    
    let BSSVCompletionStepTwo = ORKCompletionStep(identifier: String(BaselineSurveyIdentifiers.BSSVCompletionStepTwo))
    BSSVCompletionStepTwo.detailText = NSLocalizedString("Thank you for completing the Baseline Smoke/Vape survey", comment: "")
    
    steps += [BSSVCompletionStepTwo]
    
    let BSSVSurvey = ORKNavigableOrderedTask(identifier: String(BaselineSurveyIdentifiers.BSSVSurvey), steps: steps)
    
    BSSVSurvey.setNavigationRule(predicateRule, forTriggerStepIdentifier: String(BaselineSurveyIdentifiers.BSSVImportanceStep))
    
    BSSVSurvey.setNavigationRule(directRule, forTriggerStepIdentifier: String(BaselineSurveyIdentifiers.BSSVCompletionStepOne))
    
    return BSSVSurvey
}

var dailyAlcoholSurvey : ORKTask {
    var steps = [ORKStep]()
    /// Daily alcohol whether or not question
    let DSAlcoholDrinkFilterOptionOne = NSLocalizedString("Yes", comment: "")
    let DSAlcoholDrinkFilterOptionTwo = NSLocalizedString("No", comment: "")
    
    let DSAlcoholDrinkFilterTextOptions = [
        ORKTextChoice(text: DSAlcoholDrinkFilterOptionOne, value: "Yes"),
        ORKTextChoice(text: DSAlcoholDrinkFilterOptionTwo, value: "No")
    ]
    
    let DSAlcoholDrinkFilterTitle = NSLocalizedString("Have you drank in the last 24 hours?", comment: "")
    
    let DSAlcoholDrinkFilterAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: DSAlcoholDrinkFilterTextOptions)
    let DSAlcoholDrinkFilterStep = ORKQuestionStep(identifier: String(DailySurveyIdentifiers.DSAlcoholDrinkFilterStep), title: DSAlcoholDrinkFilterTitle, answer: DSAlcoholDrinkFilterAnswerFormat)
    
    steps += [DSAlcoholDrinkFilterStep]
    
    let DSAlcoholNoDrinkStep = ORKCompletionStep(identifier: String(DailySurveyIdentifiers.DSAlcoholNoDrinkStep))
    DSAlcoholNoDrinkStep.title = "You have done a great job! Continue the hard work~"
    
    steps += [DSAlcoholNoDrinkStep]
    
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
        ORKTextChoice(text: optionTwo, value: 1),
        ORKTextChoice(text: optionThree, value: 2),
        ORKTextChoice(text: optionFour, value: 3),
        ORKTextChoice(text: optionFive, value: 4),
        ORKTextChoice(text: optionSix, value: 5),
        ORKTextChoice(text: optionSeven, value: 6),
        ORKTextChoice(text: optionEight, value: 7),
        ORKTextChoice(text: optionNine, value: 8),
        ORKTextChoice(text: optionTen, value: 9),
        ORKTextChoice(text: optionEleven, value: 10),
        ORKTextChoice(text: optionTwelve, value: 11),
        ORKTextChoice(text: optionThirteen, value: 12),
        ORKTextChoice(text: optionFourteen, value: 13),
        ORKTextChoice(text: optionFifteen, value: 14),
        ORKTextChoice(text: optionSixteen, value: 15),
        ORKTextChoice(text: optionSeventeen, value: 16)
    ]
    
    let DSAlcoholDrinkAnswerFormat = ORKAnswerFormat.valuePickerAnswerFormatWithTextChoices(DSAlcoholDrinkOptions)
    
    let DSAlcoholDrinkTitle = NSLocalizedString("In the last 24 hours, how many standard drinks of beer, wine or liquor did you have? Remember, a standard drink is 12 ounces of beer, 5 oz wine, 1.5 oz liquor.", comment: "")
    
    let DSAlcoholDrinkStep = ORKQuestionStep(identifier: String(DailySurveyIdentifiers.DSAlcoholDrinkStep), title: DSAlcoholDrinkTitle, answer: DSAlcoholDrinkAnswerFormat)
    
    steps += [DSAlcoholDrinkStep]
    
    
    //// Daily Alcohol question 2
    let DSAlcoholSituationOptionOne = NSLocalizedString("Home", comment: "")
    let DSAlcoholSituationOptionTwo = NSLocalizedString("Bar/Restuarant/Club", comment: "")
    let DSAlcoholSituationOptionThree = NSLocalizedString("Party", comment: "")
    let DSAlcoholSituationOptionFour = NSLocalizedString("Work", comment: "")
    let DSAlcoholSituationOptionFive = NSLocalizedString("Friends' Home", comment: "")
    
    let DSAlcoholSituationTextOptions = [
        ORKTextChoice(text: DSAlcoholSituationOptionOne, value: 1),
        ORKTextChoice(text: DSAlcoholSituationOptionTwo, value: 3),
        ORKTextChoice(text: DSAlcoholSituationOptionThree, value: 7),
        ORKTextChoice(text: DSAlcoholSituationOptionFour, value: 4),
        ORKTextChoice(text: DSAlcoholSituationOptionFive, value: 2)
    ]
    
    let DSAlcoholSituationTitle = NSLocalizedString("Please check the situations you drank in last night.", comment: "")
    
    let DSAlcoholSituationAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices: DSAlcoholSituationTextOptions)
    
    let DSAlcoholSituationStep = ORKQuestionStep(identifier: String(DailySurveyIdentifiers.DSAlcoholSituationStep), title: DSAlcoholSituationTitle, answer: DSAlcoholSituationAnswerFormat)
    
    steps += [DSAlcoholSituationStep]
    
    //// Daily Alcohol question 3
    let DSAlcoholConditionOptionOne = NSLocalizedString("Alone", comment: "")
    let DSAlcoholConditionOptionTwo = NSLocalizedString("Family", comment: "")
    let DSAlcoholConditionOptionThree = NSLocalizedString("Friends", comment: "")
    let DSAlcoholConditionOptionFour = NSLocalizedString("Acquaintances", comment: "")
    let DSAlcoholConditionOptionFive = NSLocalizedString("Co-workers", comment: "")
    
    let DSAlcoholConditionTextOptions = [
        ORKTextChoice(text: DSAlcoholConditionOptionOne, value: 1),
        ORKTextChoice(text: DSAlcoholConditionOptionTwo, value: 2),
        ORKTextChoice(text: DSAlcoholConditionOptionThree, value: 3),
        ORKTextChoice(text: DSAlcoholConditionOptionFour, value: 7),
        ORKTextChoice(text: DSAlcoholConditionOptionFive, value: 4)
        
    ]
    
    let DSAlcoholConditionTitle = NSLocalizedString("Who did you drink with?", comment: "")
    
    let DSAlcoholConditionAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices: DSAlcoholConditionTextOptions)
    
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
    let DSAlcoholReasonOptionEight = NSLocalizedString("I wanted to taste a good alcoholic drink", comment: "")
    let DSAlcoholReasonOptionNine = NSLocalizedString("I just did it without thinking", comment: "")
    let DSAlcoholReasonOptionTen = NSLocalizedString("Someone asked me to  a drink", comment: "")
    
    
    let DSAlcoholReasonTextOptions = [
        ORKTextChoice(text: DSAlcoholReasonOptionOne, value: 1),
        ORKTextChoice(text: DSAlcoholReasonOptionTwo, value: 2),
        ORKTextChoice(text: DSAlcoholReasonOptionThree, value: 3),
        ORKTextChoice(text: DSAlcoholReasonOptionFour, value: 4),
        ORKTextChoice(text: DSAlcoholReasonOptionFive, value: 5),
        ORKTextChoice(text: DSAlcoholReasonOptionSix, value: 6),
        ORKTextChoice(text: DSAlcoholReasonOptionSeven, value: 7),
        ORKTextChoice(text: DSAlcoholReasonOptionEight, value: 8),
        ORKTextChoice(text: DSAlcoholReasonOptionNine, value: 9),
        ORKTextChoice(text: DSAlcoholReasonOptionTen, value: 11)
    ]
    
    let DSAlcoholReasonTitle = NSLocalizedString("What were the main reasons you drank last night (check all that apply)?", comment: "")
    
    let DSAlcoholReasonAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices: DSAlcoholReasonTextOptions)
    
    let DSAlcoholReasonStep = ORKQuestionStep(identifier: String(DailySurveyIdentifiers.DSAlcoholReasonStep), title: DSAlcoholReasonTitle, answer: DSAlcoholReasonAnswerFormat)
    
    steps += [DSAlcoholReasonStep]
    
    //// Daily Alcohol question 5
    let DSAlcoholIntentionOptionOne = NSLocalizedString("No", comment: "")
    let DSAlcoholIntentionOptionTwo = NSLocalizedString("Yes", comment: "")
    
    let DSAlcoholIntentionTextOptions = [
        ORKTextChoice(text: DSAlcoholIntentionOptionOne, value: "No"),
        ORKTextChoice(text: DSAlcoholIntentionOptionTwo, value: "Yes")
    ]
    
    let DSAlcoholIntentionTitle = NSLocalizedString("Did you intentionally try to limit your drinking last night?", comment: "")
    
    let DSAlcoholIntentionAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: DSAlcoholIntentionTextOptions)
    
    let DSAlcoholIntentionStep = ORKQuestionStep(identifier: String(DailySurveyIdentifiers.DSAlcoholIntentionStep), title: DSAlcoholIntentionTitle, answer: DSAlcoholIntentionAnswerFormat)
    
    steps += [DSAlcoholIntentionStep]
    //// Daily Alcohol question 6
    let DSAlcoholSleepAnswerFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(8, minimumValue: 0, defaultValue: NSIntegerMax, step: 1, vertical: true, maximumValueDescription: "Very good", minimumValueDescription: "Very bad")
    let DSAlcoholSleepTitle = NSLocalizedString("How would you rate your overall sleep quality last night?", comment: "")
    let DSAlcoholSleepStep = ORKQuestionStep(identifier: String(DailySurveyIdentifiers.DSAlcoholSleepStep), title: DSAlcoholSleepTitle, answer: DSAlcoholSleepAnswerFormat)
    
    steps += [DSAlcoholSleepStep]

    //// Daily Alcohol question 7
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
    
    
    let DSAlcoholResultSelector = ORKResultSelector(resultIdentifier: String(DailySurveyIdentifiers.DSAlcoholDrinkFilterStep))
    
    let DSAlcoholPredicate = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(DSAlcoholResultSelector, expectedAnswerValue: "Yes")
    
    let DSAlcoholPredicateRule = ORKPredicateStepNavigationRule(resultPredicates: [DSAlcoholPredicate], destinationStepIdentifiers: [String(DailySurveyIdentifiers.DSAlcoholDrinkStep)], defaultStepIdentifier:  String(DailySurveyIdentifiers.DSAlcoholNoDrinkStep), validateArrays: true)
    
    let DSAlcoholTask = ORKNavigableOrderedTask(identifier: String(DailySurveyIdentifiers.DSAlcoholSurvey), steps: steps)
    
    DSAlcoholTask.setNavigationRule(DSAlcoholPredicateRule, forTriggerStepIdentifier: String(DailySurveyIdentifiers.DSAlcoholDrinkFilterStep))
    let directRule = ORKDirectStepNavigationRule(destinationStepIdentifier: ORKNullStepIdentifier)
    
    DSAlcoholTask.setNavigationRule(directRule, forTriggerStepIdentifier: String(DailySurveyIdentifiers.DSAlcoholNoDrinkStep))
    
    return DSAlcoholTask
    
}
var dailySVSurvey: ORKTask {
    var steps = [ORKStep]()
    /// Dailsy SV filter question
    let DSSVFilterOptionOne = NSLocalizedString("Yes", comment: "")
    let DSSVFilterOptionTwo = NSLocalizedString("No", comment: "")
    
    let DSSVFilterTextOptions = [
        ORKTextChoice(text: DSSVFilterOptionOne, value: "Yes"),
        ORKTextChoice(text: DSSVFilterOptionTwo, value: "No")
    ]
    
    let DSSVFilterTitle = NSLocalizedString("Have you smoked/vaped in the last 24 hours?", comment: "")
    
    let DSSVFilterAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices:DSSVFilterTextOptions)
    let DSSVFilterStep = ORKQuestionStep(identifier: String(DailySurveyIdentifiers.DSSVFilterStep), title: DSSVFilterTitle, answer: DSSVFilterAnswerFormat)
    
    steps += [DSSVFilterStep]
    
    let DSSVNoStep = ORKCompletionStep(identifier: String(DailySurveyIdentifiers.DSSVNoStep))
    DSSVNoStep.title = "You have done a great job! Continue the hard work~"
    
    steps += [DSSVNoStep]
    
    ///// Daily SV question 1
    let DSSVIntoxicationAnswerFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(8, minimumValue: 0, defaultValue: NSIntegerMax, step: 1, vertical: true, maximumValueDescription: "Highest level I can remember", minimumValueDescription: "Not at all high")
    let DSSVIntoxicationTitle = NSLocalizedString("How high did you feel last night?", comment: "")
    let DSSVIntoxicationStep = ORKQuestionStep(identifier: String(DailySurveyIdentifiers.DSSVIntoxicationStep), title: DSSVIntoxicationTitle, answer: DSSVIntoxicationAnswerFormat)
    
    steps += [DSSVIntoxicationStep]
    
    
    //// Daily SV question 2
    let DSSVSituationOptionOne = NSLocalizedString("Home", comment: "")
    let DSSVSituationOptionTwo = NSLocalizedString("Bar/Restuarant/Club", comment: "")
    let DSSVSituationOptionThree = NSLocalizedString("Party", comment: "")
    let DSSVSituationOptionFour = NSLocalizedString("Work", comment: "")
    let DSSVSituationOptionFive = NSLocalizedString("Friends' Home", comment: "")
    let DSSVSituationOptionSix = NSLocalizedString("Other", comment: "")

    
    let DSSVSituationTextOptions = [
        ORKTextChoice(text: DSSVSituationOptionOne, value: 1),
        ORKTextChoice(text: DSSVSituationOptionTwo, value: 3),
        ORKTextChoice(text: DSSVSituationOptionThree, value: 7),
        ORKTextChoice(text: DSSVSituationOptionFour, value: 4),
        ORKTextChoice(text: DSSVSituationOptionFive, value: 2),
        ORKTextChoice(text: DSSVSituationOptionSix, value: 99)
    ]
    
    let DSSVSituationTitle = NSLocalizedString("Please check the situations you smoked/vaped in yesterday.", comment: "")
    
    let DSSVSituationAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices: DSSVSituationTextOptions)
    
    let DSSVSituationStep = ORKQuestionStep(identifier: String(DailySurveyIdentifiers.DSSVSituationStep), title: DSSVSituationTitle, answer: DSSVSituationAnswerFormat)
    steps += [DSSVSituationStep]
    
    //// Daily SV question 3
    let DSSVConditionOptionOne = NSLocalizedString("Alone", comment: "")
    let DSSVConditionOptionTwo = NSLocalizedString("Family", comment: "")
    let DSSVConditionOptionThree = NSLocalizedString("Friends", comment: "")
    let DSSVConditionOptionFour = NSLocalizedString("Acquaintances", comment: "")
    let DSSVConditionOptionFive = NSLocalizedString("Co-workers", comment: "")
    
    let DSSVConditionTextOptions = [
        ORKTextChoice(text: DSSVConditionOptionOne, value: 1),
        ORKTextChoice(text: DSSVConditionOptionTwo, value: 2),
        ORKTextChoice(text: DSSVConditionOptionThree, value: 3),
        ORKTextChoice(text: DSSVConditionOptionFour, value: 7),
        ORKTextChoice(text: DSSVConditionOptionFive, value: 4)
        
    ]
    
    let DSSVConditionTitle = NSLocalizedString("Who did you smoked/vaped with?", comment: "")
    
    let DSSVConditionAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices: DSSVConditionTextOptions)
    
    let DSSVConditionStep = ORKQuestionStep(identifier: String(DailySurveyIdentifiers.DSSVConditionStep), title: DSSVConditionTitle, answer: DSSVConditionAnswerFormat)
    
    steps += [DSSVConditionStep]
    
    //// Daily SV question 4
    let DSSVReasonOptionOne = NSLocalizedString("To celebrate, party and have a good time", comment: "")
    let DSSVReasonOptionTwo = NSLocalizedString("TTo more be friendly with others", comment: "")
    let DSSVReasonOptionThree = NSLocalizedString("To feel less anxious or stressed", comment: "")
    let DSSVReasonOptionFour = NSLocalizedString("To unwind or relax after a long day", comment: "")
    let DSSVReasonOptionFive = NSLocalizedString("To feel less bored", comment: "")
    let DSSVReasonOptionSix = NSLocalizedString("To feel happier and alive", comment: "")
    let DSSVReasonOptionSeven = NSLocalizedString("To escape or forget about problems", comment: "")
    let DSSVReasonOptionEight = NSLocalizedString("I like the taste", comment: "")
    let DSSVReasonOptionNine = NSLocalizedString("It is a habit and I just do it without thinking", comment: "")
    let DSSVReasonOptionTen = NSLocalizedString("I like the whole experience/story associated with drinking", comment: "")
    let DSSVReasonOptionEleven = NSLocalizedString("Someone offered it to me", comment: "")
    let DSSVReasonOptionTwelve = NSLocalizedString("To get through the day", comment: "")
    let DSSVReasonOptionThirteen = NSLocalizedString(" I wanted to just feel high", comment: "")
    
    
    let DSSVReasonTextOptions = [
        ORKTextChoice(text: DSSVReasonOptionOne, value: 1),
        ORKTextChoice(text: DSSVReasonOptionTwo, value: 2),
        ORKTextChoice(text: DSSVReasonOptionThree, value: 3),
        ORKTextChoice(text: DSSVReasonOptionFour, value: 4),
        ORKTextChoice(text: DSSVReasonOptionFive, value: 5),
        ORKTextChoice(text: DSSVReasonOptionSix, value: 6),
        ORKTextChoice(text: DSSVReasonOptionSeven, value: 7),
        ORKTextChoice(text: DSSVReasonOptionEight, value: 8),
        ORKTextChoice(text: DSSVReasonOptionNine, value: 9),
        ORKTextChoice(text: DSSVReasonOptionTen, value: 10),
        ORKTextChoice(text: DSSVReasonOptionEleven, value: 11),
        ORKTextChoice(text: DSSVReasonOptionTwelve, value: 12),
        ORKTextChoice(text: DSSVReasonOptionThirteen, value: 13)
        
    ]
    
    let DSSVReasonTitle = NSLocalizedString("What were the main reasons you smoked/vaped last night (check all that apply)?", comment: "")
    
    let DSSVReasonAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices: DSSVReasonTextOptions)
    
    let DSSVReasonStep = ORKQuestionStep(identifier: String(DailySurveyIdentifiers.DSSVReasonStep), title: DSSVReasonTitle, answer: DSSVReasonAnswerFormat)
    steps += [DSSVReasonStep]
    
    //// Daily SV question 5
    let DSSVIntentionOptionOne = NSLocalizedString("No", comment: "")
    let DSSVIntentionOptionTwo = NSLocalizedString("Yes", comment: "")
    
    let DSSVIntentionTextOptions = [
        ORKTextChoice(text: DSSVIntentionOptionOne, value: "No"),
        ORKTextChoice(text: DSSVIntentionOptionTwo, value: "Yes")
    ]
    
    let DSSVIntentionTitle = NSLocalizedString("Did you intentionally try to limit your smoking/vaping last night?", comment: "")
    
    let DSSVIntentionAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: DSSVIntentionTextOptions)
    
    let DSSVIntentionStep = ORKQuestionStep(identifier: String(DailySurveyIdentifiers.DSSVIntentionStep), title: DSSVIntentionTitle, answer: DSSVIntentionAnswerFormat)
    
    steps += [DSSVIntentionStep]
    
    //// Daily SV question 6
    let DSSVPlanOptionOne = NSLocalizedString("No", comment: "")
    let DSSVPlanOptionTwo = NSLocalizedString("Yes", comment: "")
    
    let DSSVPlanTextOptions = [
        ORKTextChoice(text: DSSVPlanOptionOne, value: "No"),
        ORKTextChoice(text: DSSVPlanOptionTwo, value: "Yes")
    ]
    
    let DSSVPlanTitle = NSLocalizedString("Do you plan on smoking/vaping in the next 24 hours?", comment: "")
    
    let DSSVPlanAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: DSSVPlanTextOptions)
    
    let DSSVPlanStep = ORKQuestionStep(identifier: String(DailySurveyIdentifiers.DSSVPlanStep), title: DSSVPlanTitle, answer: DSSVPlanAnswerFormat)
    
    steps += [DSSVPlanStep]
    
    let DSSVResultSelector = ORKResultSelector(resultIdentifier: String(DailySurveyIdentifiers.DSSVFilterStep))
    
    let DSSVPredicate = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(DSSVResultSelector, expectedAnswerValue: "Yes")
    
    let DSSVPredicateRule = ORKPredicateStepNavigationRule(resultPredicates: [DSSVPredicate], destinationStepIdentifiers: [String(DailySurveyIdentifiers.DSSVIntoxicationStep)], defaultStepIdentifier:  String(DailySurveyIdentifiers.DSSVNoStep), validateArrays: true)
    
    let DSSVTask = ORKNavigableOrderedTask(identifier: String(DailySurveyIdentifiers.DSSVSurvey), steps: steps)
    
    DSSVTask.setNavigationRule(DSSVPredicateRule, forTriggerStepIdentifier: String(DailySurveyIdentifiers.DSSVFilterStep))
    let directRule = ORKDirectStepNavigationRule(destinationStepIdentifier: ORKNullStepIdentifier)
    
    DSSVTask.setNavigationRule(directRule, forTriggerStepIdentifier: String(DailySurveyIdentifiers.DSSVNoStep))
    
    return DSSVTask
}

var eventAlcoholTask : ORKTask {
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
        ORKTextChoice(text: optionOne, value: 0),
        ORKTextChoice(text: optionTwo, value: 1),
        ORKTextChoice(text: optionThree, value: 2),
        ORKTextChoice(text: optionFour, value: 3),
        ORKTextChoice(text: optionFive, value: 4),
        ORKTextChoice(text: optionSix, value: 5),
        ORKTextChoice(text: optionSeven, value: 6),
        ORKTextChoice(text: optionEight, value: 7),
        ORKTextChoice(text: optionNine, value: 8),
        ORKTextChoice(text: optionTen, value: 9),
        ORKTextChoice(text: optionEleven, value: 10),
        ORKTextChoice(text: optionTwelve, value: 11),
        ORKTextChoice(text: optionThirteen, value: 12),
        ORKTextChoice(text: optionFourteen, value: 13),
        ORKTextChoice(text: optionFifteen, value: 14),
        ORKTextChoice(text: optionSixteen, value: 15),
        ORKTextChoice(text: optionSeventeen, value: 16)
        
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

var eventSVTask : ORKTask {
    //// Event question 1
    let SVEventOptionOne = NSLocalizedString("0 - 15 minutes", comment: "")
    let SVEventOptionTwo = NSLocalizedString("16 - 30 minutes", comment: "")
    let SVEventOptionThree = NSLocalizedString("30 - 60 minutes", comment: "")
    let SVEventOptionFour = NSLocalizedString("1 - 2 hours", comment: "")
    let SVEventOptionFive = NSLocalizedString("2 - 3 hours", comment: "")
    let SVEventOptionSix = NSLocalizedString("3 hours or more", comment: "")
    
    
    let SVEventTextOptions = [
        ORKTextChoice(text: SVEventOptionOne, value: 1),
        ORKTextChoice(text: SVEventOptionTwo, value: 2),
        ORKTextChoice(text: SVEventOptionThree, value: 3),
        ORKTextChoice(text: SVEventOptionFour, value: 4),
        ORKTextChoice(text: SVEventOptionFive, value: 5),
        ORKTextChoice(text: SVEventOptionSix, value: 6)
    ]
    let SVEventTitle = NSLocalizedString("How long has it been since you last smoked/vaped?", comment: "")
    
    let SVEventAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: SVEventTextOptions)
    
    let SVEventStep = ORKQuestionStep(identifier: String(BaselineSurveyIdentifiers.BSAlcoholSymptomStep), title: SVEventTitle, answer: SVEventAnswerFormat)
    
    /// Event question 2
    let SVEventIntoxicationAnswerFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(8, minimumValue: 0, defaultValue: NSIntegerMax, step: 1, vertical: true, maximumValueDescription: "Highest level I can remember", minimumValueDescription: "Not at all high")
    let SVEventIntoxicationTitle = NSLocalizedString("How high do you feel right now?", comment: "")
    let SVEventIntoxicationStep = ORKQuestionStep(identifier: String(EventIdentifiers.SVEventIntoxicationStep), title: SVEventIntoxicationTitle, answer: SVEventIntoxicationAnswerFormat)

    return ORKOrderedTask(identifier: String(EventIdentifiers.SVEventSurvey), steps: [SVEventStep, SVEventIntoxicationStep])
}

var thoughtTask : ORKTask {
    let thoughtAnswerFormat = ORKTextAnswerFormat(maximumLength: 125)
    thoughtAnswerFormat.multipleLines = true
    let thoughtQuestionStepTitle = "How do you feel today?"
    let thoughtQuestionStep = ORKQuestionStep(identifier: String(OtherTasksIdentifiers.ThoughtQuestionStep), title: thoughtQuestionStepTitle, answer: thoughtAnswerFormat)
    thoughtQuestionStep.optional = false
    return ORKOrderedTask(identifier: String(OtherTasksIdentifiers.YourThought), steps: [thoughtQuestionStep])
}

var loginTask : ORKTask {
    let loginAnswerFormat = ORKAnswerFormat.textAnswerFormat()
    loginAnswerFormat.multipleLines = false
    loginAnswerFormat.secureTextEntry = true
    loginAnswerFormat.autocapitalizationType = UITextAutocapitalizationType.None
    loginAnswerFormat.autocorrectionType = UITextAutocorrectionType.No
    loginAnswerFormat.spellCheckingType = UITextSpellCheckingType.No
    
    let loginItem : ORKFormItem = ORKFormItem(identifier: String(OtherTasksIdentifiers.LogInItem), text: "Passcode", answerFormat: loginAnswerFormat, optional: false)
    loginItem.placeholder = "Your passcode for the study"
    let loginTitle = "Log In"
    let loginText = "Please enter your passcode"
    let loginStep = ORKFormStep(identifier: String(OtherTasksIdentifiers.LogInStep), title: loginTitle, text: loginText)
     loginStep.optional = false
    loginStep.formItems = [loginItem]
    
    let waitTitle = NSLocalizedString("Logging in", comment: "")
    let waitText = NSLocalizedString("Please wait while we validate your credentials", comment: "")
    let waitStep = ORKWaitStep(identifier: String(OtherTasksIdentifiers.WaitStep))
    waitStep.title = waitTitle
    waitStep.text = waitText
    
    return ORKOrderedTask(identifier: String(OtherTasksIdentifiers.LogIn), steps: [loginStep, waitStep])
}