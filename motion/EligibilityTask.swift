////
////  EligibilityTask.swift
////  motion
////
////  Created by judywu on 2/24/16.
////  Copyright © 2016 CASPIR. All rights reserved.
////
//
//import ResearchKit
//
//private var eligibilityTask: ORKTask {
//    // Intro step
////    let introStep = ORKInstructionStep(identifier: String(Identifier.EligibilityIntroStep))
////    introStep.title = NSLocalizedString("Eligibility", comment: "")
//    
//    // Form step
//    let formStep = ORKFormStep(identifier: "EligibilityFormStep")
//    formStep.title = NSLocalizedString("Eligibility", comment: "")
//    formStep.text = "Please answer the following questions"
//    formStep.optional = false
//    
//    // Form items
//    let textChoices : [ORKTextChoice] = [ORKTextChoice(text: "Yes", value: "Yes"), ORKTextChoice(text: "No", value: "No"), ORKTextChoice(text: "N/A", value: "N/A")]
//    let answerFormat = ORKTextChoiceAnswerFormat(style: ORKChoiceAnswerStyle.SingleChoice, textChoices: textChoices)
//    
//    let formQuestion1 = ORKFormItem(identifier: "EligibilityFormQuestion1", text: "Do you drink everyday?", answerFormat: answerFormat)
//    formQuestion1.optional = false
//    let formQuestion2 = ORKFormItem(identifier: "EligibilityFormQuestion2", text: "Can you control your drinking?", answerFormat: answerFormat)
//    formQuestion2.optional = false
//    let formQuestion3 = ORKFormItem(identifier: "EligibilityFormQuestion3", text: "Are you comfortable getting alerts once a day?", answerFormat: answerFormat)
//    formQuestion3.optional = false
//    
//    formStep.formItems = [
//        formQuestion1,
//        formQuestion2,
//        formQuestion3
//    ]
//    
//    // Ineligible step
//    let ineligibleStep = ORKInstructionStep(identifier: "EligibilityIneligibleStep")
//    ineligibleStep.title = NSLocalizedString("You are ineligible to join the study", comment: "")
//    
//    // Eligible step
//    let eligibleStep = ORKCompletionStep(identifier: "EligibilityEligibleStep")
//    eligibleStep.title = NSLocalizedString("You are eligible to join the study", comment: "You should still share the app to help the others.")
//    
//    // Create the task
//    let eligibilityTask = ORKNavigableOrderedTask(identifier: "EligibilityTask", steps: [
//        //            introStep,
//        formStep,
//        ineligibleStep,
//        eligibleStep
//        ])
//    
//    // Build navigation rules.
//    var resultSelector = ORKResultSelector(stepIdentifier: String(Identifier.EligibilityFormStep), resultIdentifier: String(Identifier.EligibilityFormItem01))
//    let predicateFormItem01 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(resultSelector, expectedAnswerValue: "Yes")
//    
//    resultSelector = ORKResultSelector(stepIdentifier: String(Identifier.EligibilityFormStep), resultIdentifier: String(Identifier.EligibilityFormItem02))
//    let predicateFormItem02 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(resultSelector, expectedAnswerValue: "Yes")
//    
//    resultSelector = ORKResultSelector(stepIdentifier: String(Identifier.EligibilityFormStep), resultIdentifier: String(Identifier.EligibilityFormItem03))
//    let predicateFormItem03 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(resultSelector, expectedAnswerValue: "No")
//    
//    let predicateEligible = NSCompoundPredicate(andPredicateWithSubpredicates: [predicateFormItem01, predicateFormItem02, predicateFormItem03])
//    let predicateRule = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [ (predicateEligible, String(Identifier.EligibilityEligibleStep)) ])
//    
//    eligibilityTask.setNavigationRule(predicateRule, forTriggerStepIdentifier:String(Identifier.EligibilityFormStep))
//    
//    // Add end direct rules to skip unneeded steps
//    let directRule = ORKDirectStepNavigationRule(destinationStepIdentifier: ORKNullStepIdentifier)
//    eligibilityTask.setNavigationRule(directRule, forTriggerStepIdentifier:String(Identifier.EligibilityIneligibleStep))
//    
//    return eligibilityTask
//}