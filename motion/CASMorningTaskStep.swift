//
//  CASMorningTaskStep.swift
//  motion
//
//  Created by judywu on 3/21/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import UIKit
import ResearchKit

class CASMorningTaskStep: ORKInstructionStep {
    override init(identifier: String) {
        super.init(identifier: identifier)
        
        title = NSLocalizedString("Thank you for completing the morning survey", comment: "")
        text = NSLocalizedString("You will be asked to complete one active task now.", comment: "")
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
