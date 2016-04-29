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
        }
    }
    
    var content: String {
        switch self {
        case BaselineAlcoholFeedback1:
            return "It’s great you joined a study to understand your drinking over the next month. Tracking your drinking can help you understand your patterns so you can make informed choices about your drinking. After the study period, you can contact the researcher if you want to help you determine the best course of action for you. You can email us at any time with questions or concerns. Thank you."
        case BaselineAlcoholFeedback2:
            return "Your current pattern suggests you are drinking more than is recommended  for your health and wellbeing. It’s great you joined a study to understand your drinking over the next month. Tracking your drinking can help you understand your patterns so you can make informed choices about your drinking. After the study period, you can contact the researcher if you want to help you determine the best course of action for you. You can email us at any time with questions or concerns. Thank you."
        case BaselineAlcoholFeedback3:
            return "Your current pattern suggests you are drinking more than is recommended  for your health and wellbeing. It is recommended that you drink no more than 4 drinks in any one sitting and no more than 14 drinks per week as a long-term goal. Your desire to change your drinking is a great step towards improved wellbeing. Tracking your drinking over the next month can help you understand your patterns and move you toward the path to change. After the study period, you can contact the researcher to help you determine the best course of action for you. You can email us at any time with questions or concerns. Thank you."
        case BaselineAlcoholFeedback4:
            return "Your current pattern suggests you are drinking more than is recommended for your health and wellbeing. It is recommended that you drink no more than 4 drinks in any one sitting and no more than 14 drinks per week as a long-term goal. Your desire to change your drinking is a great step towards improved wellbeing. Tracking your drinking over the next month can help you understand your patterns and move you toward the path to change. After the study period, you can contact the researcher to help you determine the best course of action for you. You can email us at any time with questions or concerns. Thank you."

            
        /// Baseline smoke/vape
        case BaselineSVFeedback1:
            return "It’s great you joined a study to understand your use over the next month. Tracking your use can help you understand your patterns so you can make informed choices about your use. After the study period, you can contact the researcher if you want to help you determine the best course of action for you. You can email us at any time with questions or concerns. Thank you."
        case BaselineSVFeedback2:
            return "Your current pattern of use suggests you smoke more than 98% of Americans. It’s great you joined a study to understand your use over the next month. Tracking your use can help you understand your patterns so you can make informed choices about your use. After the study period, you can contact the researcher if you want to help you determine the best course of action for you. You can email us at any time with questions or concerns. Thank you."
        case BaselineSVFeedback3:
            return "Your current pattern of use suggests you smoke more than 98% of Americans.  You indicated it is important to change your use and this desire to change is a step towards improved wellbeing. Tracking your use over the next month can help you understand your patterns and move you to a path towards change. After the study period, you can contact the researcher if you want to help you determine the best course of action for you. You can email us at any time with questions concerns. Thank you."
        case BaselineSVFeedback4:
            return "Your current pattern of use suggests you smoke more than 98% of Americans. It’s great you joined a study to understand your use over the next month. Tracking your use can help you understand your patterns so you can make informed choices about your use. After the study period, you can contact the researcher if you want to help you determine the best course of action for you. You can email us at any time with questions or concerns. Thank you."
        
        }
    }
}
