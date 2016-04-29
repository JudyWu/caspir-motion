/*
 Copyright (c) 2015, Apple Inc. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:
 
 1.  Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 2.  Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation and/or
 other materials provided with the distribution.
 
 3.  Neither the name of the copyright holder(s) nor the names of any contributors
 may be used to endorse or promote products derived from this software without
 specific prior written permission. No license is granted to the trademarks of
 the copyright holders even if such marks are included in this software.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import ResearchKit

class CASConsentDocument: ORKConsentDocument {
    // MARK: Properties
    
    let ipsum = [
        "Welcome to the Insightful Choices study for people who want to learn more about their alcohol and marijuana use. During this study, you will be prompted to enter brief information about your alcohol and/or marijuana use from the previous day every morning for 30 days along with completing one of several game like tasks that take about 1 minute. In addition, we ask that you open the app each time you have been drinking and/or smoking and answer a few questions and complete a task.",
        "We will be collecting information from you today and over the next 30 days. The data we collect will be based on how you answer the questions, the tasks you complete and about your activity and sleep.",
        "We protect your privacy in several ways...",
        "The time commitment for this study includes this introductory overview and consent and about 6 minutes of questions and mini-tasks. Then over the next 30 days you will be prompted to answer a few questions in the morning and in the evening, each varying between about 1-3 minutes.",
        "The study survey you complete today take about 3 minutes to complete and includes questions about your drinking and/or marijuana use, the typical situations in which it happens, your motivations, your feelings about whether it is a problem for you, and your goals. Once you begin the study, you will be prompted to complete a 5 question morning survey for the next 30 days (or more if you want) about the previous night and how you feel this morning. You will also be prompted in the evening to complete some questions or on your own, each time you are drinking or using substance.",
        "In addition to the questions, you will complete one of four game like tasks in the morning and in the evening. Today we will ask you to complete them all but after it will only be one at a time.",
        "You can withdraw or leave the study at any time. Simply, delete the app from your phone and you are automatically withdrawn from any future data collection. You can contact us at any time for more informaiton."
    ]
    
    // MARK: Initialization
    
    override init() {
        super.init()
        
        title = NSLocalizedString("Research Health Study Consent Form", comment: "")
        
        let sectionTypes: [ORKConsentSectionType] = [
            .Overview,
            .DataGathering,
            .Privacy,
            .TimeCommitment,
            .StudySurvey,
            .StudyTasks,
            .Withdrawing
        ]
        
        sections = zip(sectionTypes, ipsum).map { sectionType, ipsum in
            let section = ORKConsentSection(type: sectionType)
            
            let localizedIpsum = NSLocalizedString(ipsum, comment: "")
            let localizedSummary = localizedIpsum.componentsSeparatedByString(".")[0] + "."
            
            section.summary = localizedSummary
            section.content = localizedIpsum
            
            return section
        }
        
        let signature = ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "ConsentDocumentParticipantSignature")
        addSignature(signature)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ORKConsentSectionType: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .Overview:
            return "Overview"
            
        case .DataGathering:
            return "DataGathering"
            
        case .Privacy:
            return "Privacy"
            
        case .TimeCommitment:
            return "TimeCommitment"
            
        case .StudySurvey:
            return "StudySurvey"
            
        case .StudyTasks:
            return "StudyTasks"
            
        case .Withdrawing:
            return "Withdrawing"
            
        case .Custom:
            return "Custom"
            
        case .OnlyInDocument:
            return "OnlyInDocument"
            
        default:
            return ""
        }
    }
}