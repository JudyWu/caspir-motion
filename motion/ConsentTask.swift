//
//  ConsentTask.swift
//  motion
//
//  Created by judywu on 12/19/15.
//  Copyright © 2015 CASPIR. All rights reserved.
//
import ResearchKit

import Foundation

public var ConsentTask: ORKOrderedTask {
    var steps = [ORKStep]()
    
    let consentDocument = ConsentDocument
    let visualConsentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: ConsentDocument)
    steps += [visualConsentStep]
    
    let signature = consentDocument.signatures!.first! as ORKConsentSignature
    let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: signature, inDocument: consentDocument)
    
    reviewConsentStep.text = "Review Consent!"
    reviewConsentStep.reasonForConsent = "Consent to join study"
    
    steps += [reviewConsentStep]
    
    return ORKOrderedTask(identifier: "ConsentTask", steps: steps)

}
