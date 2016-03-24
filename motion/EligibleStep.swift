//
//  EligibleStep.swift
//  motion
//
//  Created by judywu on 3/5/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//
import UIKit
import ResearchKit

class EligibleStep: ORKInstructionStep {
    override init(identifier: String) {
        super.init(identifier: identifier)
        
        title = NSLocalizedString("You are eligible", comment: "")
        text = NSLocalizedString("On the next screen, you will be asked to read and sign the consent document", comment: "")
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
