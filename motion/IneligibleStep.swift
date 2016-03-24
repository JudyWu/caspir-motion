//
//  IneligibleStep.swift
//  motion
//
//  Created by judywu on 3/5/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import ResearchKit

class IneligibleStep: ORKInstructionStep {
    override init(identifier: String) {
        super.init(identifier: identifier)
        
        title = NSLocalizedString("Sorry you are ineligible", comment: "")
        text = NSLocalizedString("Please email us at CASPIR@northwell.edu for more information", comment: "")
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}