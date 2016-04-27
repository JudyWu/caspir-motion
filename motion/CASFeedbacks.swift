//
//  CASFeedbacks.swift
//  motion
//
//  Created by Zhaoxin Wu on 4/22/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import Foundation

enum Feedbacks: Int {
    /// Baseline alcohol
    case BaselineAlcoholFeedback1
    case BaselineAlcoholFeedback2
    case BaselineAlcoholFeedback3
    case BaselineAlcoholFeedback4
    
    /// Baseline smoke/vape
    case BaselineSVFeedback1
    case BaselineSVFeedback2
    case BaselineSVFeedback3
    case BaselineSVFeedback4
    
    /// 30 days alcohol
    case ThirtyAlcoholFeedback1
    case ThirtyAlcoholFeedback2
    
    /// 30 days smoke/vape
    case ThirtySVFeedback1
    case ThirtySVFeedback2
    
    
    var name: String {
        switch self {
        case BaselineAlcoholFeedback1:
            return ""
        case BaselineAlcoholFeedback2:
            return ""
        case BaselineAlcoholFeedback3:
            return ""
        case BaselineAlcoholFeedback4:
            return ""
            
        /// Baseline smoke/vape
        case BaselineSVFeedback1:
            return ""
        case BaselineSVFeedback2:
            return ""
        case BaselineSVFeedback3:
            return ""
        case BaselineSVFeedback4:
            return ""
            
        /// 30 days alcohol
        case ThirtyAlcoholFeedback1:
            return ""
        case ThirtyAlcoholFeedback2:
            return ""
            
        /// 30 days smoke/vape
        case ThirtySVFeedback1:
            return ""
        case ThirtySVFeedback2:
            return ""
        }
    }
    
    var type: String {
        switch self {
        case BaselineAlcoholFeedback1:
            return ""
        case BaselineAlcoholFeedback2:
            return ""
        case BaselineAlcoholFeedback3:
            return ""
        case BaselineAlcoholFeedback4:
            return ""
            
        /// Baseline smoke/vape
        case BaselineSVFeedback1:
            return ""
        case BaselineSVFeedback2:
            return ""
        case BaselineSVFeedback3:
            return ""
        case BaselineSVFeedback4:
            return ""

            
        /// 30 days alcohol
        case ThirtyAlcoholFeedback1:
            return ""
        case ThirtyAlcoholFeedback2:
            return ""
            
        /// 30 days smoke/vape
        case ThirtySVFeedback1:
            return ""
        case ThirtySVFeedback2:
            return ""
        }
    }
    
    var content: String {
        switch self {
        case BaselineAlcoholFeedback1:
            return "Your heavy drinking day is below 5"
        case BaselineAlcoholFeedback2:
            return "Your heavy drinking day is above 5 and importance is below 3"
        case BaselineAlcoholFeedback3:
            return "Your heavy drinking day is above 5 and importance is above 3"
        case BaselineAlcoholFeedback4:
            return "Your heavy drinking day is above 15"

            
        /// Baseline smoke/vape
        case BaselineSVFeedback1:
            return "Your days of smoke is below 8"
        case BaselineSVFeedback2:
            return "Your days of smoke is above 8 and importance is below 3"
        case BaselineSVFeedback3:
            return "Your days of smoke is above 8 and importance is above 3"
        case BaselineSVFeedback4:
            return "Your days of smoke is above 15"
            
        /// 30 days alcohol
        case ThirtyAlcoholFeedback1:
            return "You have been heavily drinking over 50% of the study period"
        case ThirtyAlcoholFeedback2:
            return "You have been heavily drinking less than 50% of the study period"
            
        /// 30 days smoke/vape
        case ThirtySVFeedback1:
            return "You have been smoking over 50% of the study period"
        case ThirtySVFeedback2:
            return "You have been smoking less than 50% of the study period"
        }
    }
}
