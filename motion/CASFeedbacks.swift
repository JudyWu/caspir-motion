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
    case BaselineAlcoholFeedback5
    
    /// Baseline smoke/vape
    case BaselineSVFeedback1
    case BaselineSVFeedback2
    case BaselineSVFeedback3
    case BaselineSVFeedback4
    case BaselineSVFeedback5
    
    /// 30 days alcohol
    case ThirtyAlcoholFeedback1
    case ThirtyAlcoholFeedback2
    
    /// 30 days smoke/vape
    case ThirtySVFeedback1
    case ThirtySVFeedback2
    
    static var rows : [Feedbacks] {
        return [BaselineAlcoholFeedback1, BaselineAlcoholFeedback2, BaselineAlcoholFeedback3, BaselineAlcoholFeedback4, BaselineAlcoholFeedback5, BaselineSVFeedback1, BaselineSVFeedback2, BaselineSVFeedback3, BaselineSVFeedback4, BaselineSVFeedback5, ThirtyAlcoholFeedback1, ThirtyAlcoholFeedback2, ThirtySVFeedback1, ThirtySVFeedback2]
    }
    
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
        case BaselineAlcoholFeedback5:
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
        case BaselineSVFeedback5:
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
        case BaselineAlcoholFeedback5:
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
        case BaselineSVFeedback5:
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
            return ""
        case BaselineAlcoholFeedback2:
            return ""
        case BaselineAlcoholFeedback3:
            return ""
        case BaselineAlcoholFeedback4:
            return ""
        case BaselineAlcoholFeedback5:
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
        case BaselineSVFeedback5:
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
}
