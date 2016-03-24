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
//import ResearchKit
////import AudioToolbox
////
////class SystemSound {
////    var soundID: SystemSoundID = 0
////    
////    init?(soundURL: NSURL) {
////        if AudioServicesCreateSystemSoundID(soundURL as CFURLRef, &soundID) != noErr {
////            return nil
////        }
////    }
////    deinit {
////        AudioServicesDisposeSystemSoundID(soundID)
////    }
////}
////
//enum TaskListRow: Int {
//    case BaselineTDSSurvey
//    case DailyDrinkingSurvey
//    case GaitAndBalanceTask
//    case TappingIntervalTask
//    case ReactionTimeTask
//    case ExtraThoughtSurvey
//    
//    static var allValues: [TaskListRow] {
//        var idx = 0
//        return Array(anyGenerator{ return self.init(rawValue: idx++)})
//    }
//    
//    class TaskListRowSection {
//        var title: String
//        var rows: [TaskListRow]
//        
//        init(title: String, rows: [TaskListRow]) {
//            self.title = title
//            self.rows = rows
//        }
//    }
//    
//    static var sections: [TaskListRowSection] {
//        return [
//            TaskListRowSection(title: "Survey", rows:
//                [
//                    .BaselineTDSSurvey,
//                    .DailyDrinkingSurvey
//                ]),
//            TaskListRowSection(title: "Tasks", rows:
//                [
//                    .GaitAndBalanceTask,
//                    .ReactionTimeTask,
//                    .TappingIntervalTask
//                ]),
//            TaskListRowSection(title: "More thoughts", rows:
//                [
//                    .ExtraThoughtSurvey
//                ])
//        ]
//    }
//    
//    var title: String {
//        switch self {
//        case .BaselineTDSSurvey:
//            return NSLocalizedString("Baseline Survey", comment: "")
//        case .DailyDrinkingSurvey:
//            return NSLocalizedString("Daily Survey", comment: "")
//        case .ReactionTimeTask:
//            return NSLocalizedString("Reaction Time", comment: "")
//        case .GaitAndBalanceTask:
//            return NSLocalizedString("Gait and Balance", comment: "")
//        case .TappingIntervalTask:
//            return NSLocalizedString("Tapping", comment: "")
//        case .ExtraThoughtSurvey:
//            return NSLocalizedString("More thoughts", comment: "")
//        }
//    }
//    
//    var subtitle: String {
//        switch self {
//        case .BaselineTDSSurvey:
//            return "Complete your baseline drinking questions"
//        case .DailyDrinkingSurvey:
//            return "Answer 6 short questions"
//        case .GaitAndBalanceTask:
//            return "Test gait and balance"
//        case .ReactionTimeTask:
//            return "Test reaction time"
//        case .TappingIntervalTask:
//            return "Test tapping speed"
//        case .ExtraThoughtSurvey:
//            return "Markdown your daily feeling"
//        }
//    }
//    
//    var image: UIImage {
//        switch self {
//        case .BaselineTDSSurvey:
//            return UIImage(named: "survey_tag")!
//        case .DailyDrinkingSurvey:
//            return UIImage(named: "survey_tag")!
//        case .GaitAndBalanceTask:
//            return UIImage(named: "balance_tag")!
//        case .ReactionTimeTask:
//            return UIImage(named: "reaction_tag")!
//        case .TappingIntervalTask:
//            return UIImage(named: "tapping_tag")!
//        case .ExtraThoughtSurvey:
//            return UIImage(named: "green")!
//        }
//    }
//    
//    var representedTask: ORKTask {
//        switch self {
//        case .BaselineTDSSurvey:
//            return StudyTasks.baselineTDSSurvey
//        case .DailyDrinkingSurvey:
//            return StudyTasks.dailyDrinkingSurvey
//        case .GaitAndBalanceTask:
//            return StudyTasks.gaitAndBalanceTask
//        case .ReactionTimeTask:
//            return StudyTasks.reactionTimeTask
//        case .TappingIntervalTask:
//            return StudyTasks.tappingIntervalTask
//        case .ExtraThoughtSurvey:
//            return StudyTasks.extraThoughtSurvey
//            
//        }
//    }
//}
//
//
//struct StudyTasks {
//    
//    static let gaitAndBalanceTask: ORKOrderedTask = {
//        let intendedUseDescription = "For accessing your gait and balance"
//        
//        return ORKOrderedTask.shortWalkTaskWithIdentifier("GaitAndBalanceTask", intendedUseDescription: intendedUseDescription, numberOfStepsPerLeg: 10, restDuration: 10, options: ORKPredefinedTaskOption.None)
//    }()
//    
//    static let reactionTimeTask: ORKOrderedTask = {
//        let intendedUseDescription = "See how fast you react to the dot"
////        let successSoundURL = NSBundle.mainBundle().URLForResource("tap", withExtension: "aif")!
////        let successSound = SystemSound(soundURL: successSoundURL)!
//
//        return ORKOrderedTask.reactionTimeTaskWithIdentifier("ReactionTimeTask", intendedUseDescription: intendedUseDescription, maximumStimulusInterval: 10, minimumStimulusInterval: 4, thresholdAcceleration: 0.5, numberOfAttempts: 3, timeout: 3, successSound: UInt32(kSystemSoundID_Vibrate), timeoutSound: 0, failureSound: UInt32(kSystemSoundID_Vibrate), options: [])
//    }()
//    
//    static let tappingIntervalTask: ORKOrderedTask = {
//        let intendedUseDescription = "Finger tapping is a universal way to communicate."
//        
//        return ORKOrderedTask.twoFingerTappingIntervalTaskWithIdentifier("TappingIntervalTask", intendedUseDescription: intendedUseDescription, duration: 10, options: ORKPredefinedTaskOption.None)
//    }()
//    
//    static let baselineTDSSurvey: ORKOrderedTask = {
//        var steps = [ORKStep]()
//        
//        let instructionStep = ORKInstructionStep(identifier: "IntroStep")
//        instructionStep.title = "Drinking Situation"
//        instructionStep.text = "Please answer these 10 questions to the best of your ability and no questions can be skipped."
//        
//        steps += [instructionStep]
//        
//        let tdsOneNameAnswerFormat = ORKTextAnswerFormat(maximumLength: 25)
//        tdsOneNameAnswerFormat.multipleLines = false
//        let tdsOneNameQuestionStepTitle = "Under what situation you most likely to drink?"
//        let tdsOneNameQuestionStep = ORKQuestionStep(identifier: "tdsOneNameQuestionStep", title: tdsOneNameQuestionStepTitle, answer: tdsOneNameAnswerFormat)
//        
//        steps += [tdsOneNameQuestionStep]
//        
//        let tdsTwoNameAnswerFormat = ORKTextAnswerFormat(maximumLength: 25)
//        tdsTwoNameAnswerFormat.multipleLines = false
//        let tdsTwoNameQuestionStepTitle = "Under what situation you second likely to drink?"
//        let tdsTwoNameQuestionStep = ORKQuestionStep(identifier: "tdsTwoNameQuestionStep", title: tdsTwoNameQuestionStepTitle, answer: tdsTwoNameAnswerFormat)
//        
//        steps += [tdsTwoNameQuestionStep]
//        
//        let tdsThreeNameAnswerFormat = ORKTextAnswerFormat(maximumLength: 25)
//        tdsThreeNameAnswerFormat.multipleLines = false
//        let tdsThreeNameQuestionStepTitle = "Under what situation you third likely to drink?"
//        let tdsThreeNameQuestionStep = ORKQuestionStep(identifier: "tdsThreeNameQuestionStep", title: tdsThreeNameQuestionStepTitle, answer: tdsThreeNameAnswerFormat)
//        
//        steps += [tdsThreeNameQuestionStep]
//        
//        let tdsThreeFrequencyStepTitle = "How oftern will you be in that situation?"
//        let tdsThreeFrequencyTextChoices = [
//            ORKTextChoice(text: "Daily or almost daily", value: 0),
//            ORKTextChoice(text: "4-5 times per week", value: 1),
//            ORKTextChoice(text: "2-3 times per week", value: 2),
//            ORKTextChoice(text: "Once per week", value: 3),
//            ORKTextChoice(text: "Less than once per week", value: 4)
//        ]
//        let tdsThreeFrequencyAnswerFormat: ORKTextChoiceAnswerFormat = ORKTextAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: tdsThreeFrequencyTextChoices)
//        let tdsThreeFrequencyStep = ORKQuestionStep(identifier: "tdsThreeFrequencyQuestionStep", title:tdsThreeFrequencyStepTitle, answer: tdsThreeFrequencyAnswerFormat)
//        steps += [tdsThreeFrequencyStep]
//        
//        let tdsThreeTimeStepTitle = "When will that situation be?"
//        let tdsThreeTimeTextChoices = [
//            ORKTextChoice(text: "Morning", value: 0),
//            ORKTextChoice(text: "Afternoon", value: 1),
//            ORKTextChoice(text: "Evening", value: 2),
//            ORKTextChoice(text: "At bedtime", value: 3)
//        ]
//        let tdsThreeTimeAnswerFormat: ORKTextChoiceAnswerFormat = ORKTextAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: tdsThreeTimeTextChoices)
//        let tdsThreeTimeStep = ORKQuestionStep(identifier: "tdsThreeTimeQuestionStep", title:tdsThreeTimeStepTitle, answer: tdsThreeTimeAnswerFormat)
//        steps += [tdsThreeTimeStep]
//        
//        let tdsThreeDrinkingFrequencyStepTitle = "How oftern did you drink when you are in that situation?"
//        let tdsThreeDrinkingFrequencyTextChoices = [
//            ORKTextChoice(text: "Always", value: 0),
//            ORKTextChoice(text: "Almost always", value: 1),
//            ORKTextChoice(text: "Frequently", value: 2),
//            ORKTextChoice(text: "Sometimes", value: 3)
//        ]
//        
//        let tdsThreeDrinkingFrequencyAnswerFormat: ORKTextChoiceAnswerFormat = ORKTextAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: tdsThreeDrinkingFrequencyTextChoices)
//        let tdsThreeDrinkingFrequencyStep = ORKQuestionStep(identifier: "tdsThreeDrinkingFrequencyQuestionStep", title:tdsThreeDrinkingFrequencyStepTitle, answer: tdsThreeDrinkingFrequencyAnswerFormat)
//        steps += [tdsThreeDrinkingFrequencyStep]
//        
//        let baselineSummaryStep = ORKCompletionStep(identifier: "BaselineSummaryStep")
//        baselineSummaryStep.title = "Thank you"
//        baselineSummaryStep.text = "We appreciate your time."
//        
//        steps += [baselineSummaryStep]
//        
//        return ORKOrderedTask(identifier: "BaselineTDSSurvey", steps: steps)
//        
//    }()
//    
//    static let dailyDrinkingSurvey: ORKOrderedTask = {
//        var steps = [ORKStep]()
//        
//        // Instruction step
//        let instructionStep = ORKInstructionStep(identifier: "IntroStep")
//        instructionStep.title = "Knoweledge of the Universe Survey"
//        instructionStep.text = "Please answer these 6 questions to the best of your ability. It's okay to skip a question if you don't know the answer."
//        
//        steps += [instructionStep]
//        
//        // Quest question using text choice
//        let questQuestionStepTitle = "Which of the following is not a planet?"
//        let textChoices = [
//            ORKTextChoice(text: "Saturn", value: 0),
//            ORKTextChoice(text: "Uranus", value: 1),
//            ORKTextChoice(text: "Pluto", value: 2),
//            ORKTextChoice(text: "Mars", value: 3)
//        ]
//        let questAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: textChoices)
//        let questQuestionStep = ORKQuestionStep(identifier: "TextChoiceQuestionStep", title: questQuestionStepTitle, answer: questAnswerFormat)
//        
//        steps += [questQuestionStep]
//        
//        // Name question using text input
//        let nameAnswerFormat = ORKTextAnswerFormat(maximumLength: 25)
//        nameAnswerFormat.multipleLines = false
//        let nameQuestionStepTitle = "What do you think the next comet that's discovered should be named?"
//        let nameQuestionStep = ORKQuestionStep(identifier: "NameQuestionStep", title: nameQuestionStepTitle, answer: nameAnswerFormat)
//        
//        steps += [nameQuestionStep]
//        
//        let shapeQuestionStepTitle = "Which shape is the closest to the shape of Messier object 101?"
//        let shapeTuples = [
//            (UIImage(named: "square")!, "Square"),
//            (UIImage(named: "pinwheel")!, "Pinwheel"),
//            (UIImage(named: "pentagon")!, "Pentagon"),
//            (UIImage(named: "circle")!, "Circle")
//        ]
//        let imageChoices : [ORKImageChoice] = shapeTuples.map {
//            return ORKImageChoice(normalImage: $0.0, selectedImage: nil, text: $0.1, value: $0.1)
//        }
//        let shapeAnswerFormat: ORKImageChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithImageChoices(imageChoices)
//        let shapeQuestionStep = ORKQuestionStep(identifier: "ImageChoiceQuestionStep", title: shapeQuestionStepTitle, answer: shapeAnswerFormat)
//        
//        steps += [shapeQuestionStep]
//        
//        // Date question
//        let today = NSDate()
//        let dateAnswerFormat =  ORKAnswerFormat.dateAnswerFormatWithDefaultDate(nil, minimumDate: today, maximumDate: nil, calendar: nil)
//        let dateQuestionStepTitle = "When is the next solar eclipse?"
//        let dateQuestionStep = ORKQuestionStep(identifier: "DateQuestionStep", title: dateQuestionStepTitle, answer: dateAnswerFormat)
//        
//        steps += [dateQuestionStep]
//        
//        // Boolean question
//        let booleanAnswerFormat = ORKBooleanAnswerFormat()
//        let booleanQuestionStepTitle = "Is Venus larger than Saturn?"
//        let booleanQuestionStep = ORKQuestionStep(identifier: "BooleanQuestionStep", title: booleanQuestionStepTitle, answer: booleanAnswerFormat)
//        
//        steps += [booleanQuestionStep]
//        
//        // Continuous question
//        let continuousAnswerFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(150, minimumValue: 30, defaultValue: 20, step: 10, vertical: false, maximumValueDescription: "Objects", minimumValueDescription: " ")
//        let continuousQuestionStepTitle = "How many objects are in Messier's catalog?"
//        let continuousQuestionStep = ORKQuestionStep(identifier: "ContinuousQuestionStep", title: continuousQuestionStepTitle, answer: continuousAnswerFormat)
//        
//        steps += [continuousQuestionStep]
//        
//        // Summary step
//        
//        let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
//        summaryStep.title = "Thank you."
//        summaryStep.text = "We appreciate your time."
//        
//        steps += [summaryStep]
//        
//        return ORKOrderedTask(identifier: "DailyDrinkingSurvey", steps: steps)
//    }()
//    
//    static let extraThoughtSurvey: ORKOrderedTask = {
//        var steps = [ORKStep]()
//        
//        let thoughtAnswerFormat = ORKTextAnswerFormat(maximumLength: 125)
//        thoughtAnswerFormat.multipleLines = true
//        let thoughtQuestionStepTitle = "How do you feel today?"
//        let thoughtQuestionStep = ORKQuestionStep(identifier: "ThoughtQuestionStep", title: thoughtQuestionStepTitle, answer: thoughtAnswerFormat)
//        
//        steps += [thoughtQuestionStep]
//        
//        return ORKOrderedTask(identifier: "ExtraThoughtSurvey", steps: steps)
//    }()
//}
