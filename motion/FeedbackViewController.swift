//
//  FeedbackViewController.swift
//  motion
//
//  Created by judywu on 2/22/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import UIKit
import RealmSwift


class FeedbackViewController: UITableViewController {
    var timeInterval: Int?
    var nowTime : NSDate?
    var leftDays: Int?
    var rounds: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBaselineFeedback()
        
    }
    
    
    @IBOutlet weak var baselineFeedbackText: UITextView!
    @IBOutlet weak var baselineAlcoholText: UITextView!
    @IBOutlet weak var thirtyDaysFeedbackText: UITextView!
    @IBOutlet weak var thirtyDayAlcoholText: UITextView!
    
    func updateBaselineFeedback() {
        let prefs = NSUserDefaults.standardUserDefaults()
        let drugType = prefs.stringForKey("drugType")
        let participantID = prefs.stringForKey("participantID")
        
        let realm = try! Realm()
        let currentParticipant = realm.objects(Participant).filter("ID =='\(participantID)'").first
    
        if drugType == "Alcohol" {
            let aImportance = currentParticipant!.surveys.filter("name == 'BSAlcoholSurvey'").first!.aImportance
            let heavyDrinkingDay = currentParticipant!.surveys.filter("name == 'OnboardingTask'").first!.heavyDrinkingDay
            
            if heavyDrinkingDay <= 5 {
                self.baselineFeedbackText.text = Feedbacks.BaselineAlcoholFeedback1.content
            } else if heavyDrinkingDay > 5 && heavyDrinkingDay < 15 {
                if aImportance < 3 {
                    self.baselineFeedbackText.text = Feedbacks.BaselineAlcoholFeedback2.content
                } else {
                    self.baselineFeedbackText.text = Feedbacks.BaselineAlcoholFeedback3.content
                }
            } else {
                self.baselineFeedbackText.text = Feedbacks.BaselineAlcoholFeedback4.content
            }
            self.baselineAlcoholText.alpha = 0
        } else if drugType == "Smoke/Vape" {
            let sImportance = currentParticipant?.surveys.filter("name == 'BSSVSurvey'").first?.sImportance
            let smokeDay = currentParticipant?.surveys.filter("name == 'OnboardingTask'").first?.smokeDay
            if smokeDay <= 8 {
                self.baselineFeedbackText.text = Feedbacks.BaselineSVFeedback1.content
            } else if smokeDay > 8 && smokeDay < 15 {
                if sImportance < 3 {
                    self.baselineFeedbackText.text = Feedbacks.BaselineSVFeedback2.content
                } else {
                    self.baselineFeedbackText.text = Feedbacks.BaselineSVFeedback3.content
                }
            }else {
                self.baselineFeedbackText.text = Feedbacks.BaselineSVFeedback4.content
            }
            self.baselineAlcoholText.alpha = 0
        } else {
            let aImportance = currentParticipant?.surveys.filter("name == 'BSAlcoholSurvey'").first?.aImportance
            let heavyDrinkingDay = currentParticipant?.surveys.filter("name == 'OnboardingTask'").first?.heavyDrinkingDay
            
            if heavyDrinkingDay <= 5 {
                self.baselineFeedbackText.text = Feedbacks.BaselineAlcoholFeedback1.content
            } else if heavyDrinkingDay > 5 && heavyDrinkingDay < 15 {
                if aImportance < 3 {
                    self.baselineFeedbackText.text = Feedbacks.BaselineAlcoholFeedback2.content
                } else {
                    self.baselineFeedbackText.text = Feedbacks.BaselineAlcoholFeedback3.content
                }
            } else {
                self.baselineFeedbackText.text = Feedbacks.BaselineAlcoholFeedback4.content
            }
            
            let sImportance = currentParticipant?.surveys.filter("name == 'BSSVSurvey'").first?.sImportance
            let smokeDay = currentParticipant?.surveys.filter("name == 'OnboardingTask'").first?.smokeDay
            if smokeDay <= 8 {
                self.baselineAlcoholText.text = Feedbacks.BaselineSVFeedback1.content
            } else if smokeDay > 8 && smokeDay < 15 {
                if sImportance < 3 {
                    self.baselineAlcoholText.text = Feedbacks.BaselineSVFeedback2.content
                } else {
                    self.baselineAlcoholText.text = Feedbacks.BaselineSVFeedback3.content
                }
            }else {
                self.baselineAlcoholText.text = Feedbacks.BaselineSVFeedback4.content
            }
        }
    }
    
    func updateThirtyDayFeedback() {
        leftDays = 30 - (timeInterval! - rounds!*30)
        let prefs = NSUserDefaults.standardUserDefaults()
        let drugType = prefs.stringForKey("drugType")
        let participantID = prefs.stringForKey("participantID")
        
        let realm = try! Realm()
        let currentParticipant = realm.objects(Participant).filter("ID =='\(participantID)'").first
        
        if drugType == "Alcohol" {
            let alcoholSurveyNumber = currentParticipant?.surveys.filter("name == 'DSAlcoholSurvey'").count
            let heavyDayNumber = currentParticipant?.surveys.filter("name == 'DSAlcoholSurvey'").filter("dailyHeavyDrinkingDay = 'Yes'").count
            if Double(heavyDayNumber!/alcoholSurveyNumber!) > 0.5 {
                 self.thirtyDaysFeedbackText.text = Feedbacks.ThirtyAlcoholFeedback1.content
            } else {
                self.thirtyDaysFeedbackText.text = Feedbacks.ThirtyAlcoholFeedback2.content
            }
        } else if drugType == "Smoke/Vape" {
            let SVSurveyNumber = currentParticipant?.surveys.filter("name == 'DSSVSurvey'").count
            let smokeDayNumber = currentParticipant?.surveys.filter("name == 'DSSVSurvey'").filter("didSmokeDay = 'Yes'").count
            if Double(smokeDayNumber!/SVSurveyNumber!) > 0.5 {
                self.thirtyDaysFeedbackText.text = Feedbacks.ThirtySVFeedback1.content
            } else {
                self.thirtyDaysFeedbackText.text = Feedbacks.ThirtySVFeedback2.content
            }
        } else {
            let alcoholSurveyNumber = currentParticipant?.surveys.filter("name == 'DSAlcoholSurvey'").count
            let heavyDayNumber = currentParticipant?.surveys.filter("name == 'DSAlcoholSurvey'").filter("dailyHeavyDrinkingDay = 'Yes'").count
            if Double(heavyDayNumber!/alcoholSurveyNumber!) > 0.5 {
                self.thirtyDaysFeedbackText.text = Feedbacks.ThirtyAlcoholFeedback1.content
            } else {
                self.thirtyDaysFeedbackText.text = Feedbacks.ThirtyAlcoholFeedback2.content
            }
            let SVSurveyNumber = currentParticipant?.surveys.filter("name == 'DSSVSurvey'").count
            let smokeDayNumber = currentParticipant?.surveys.filter("name == 'DSSVSurvey'").filter("didSmokeDay = 'Yes'").count
            if Double(smokeDayNumber!/SVSurveyNumber!) > 0.5 {
                self.thirtyDayAlcoholText.text = Feedbacks.ThirtySVFeedback1.content
            } else {
                self.thirtyDayAlcoholText.text = Feedbacks.ThirtySVFeedback2.content
            }
        }
    }
}

extension NSDate {
    func daysFrom(date: NSDate) -> Int {
        return NSCalendar.currentCalendar().components(NSCalendarUnit.Day, fromDate: date, toDate: self, options: NSCalendarOptions.MatchLast).day
    }
    
    func minutesFrom(date: NSDate) -> Int {
        return NSCalendar.currentCalendar().components(NSCalendarUnit.Minute, fromDate: date, toDate: self, options: NSCalendarOptions.MatchLast).minute
    }
    
    func secondsFrom(date: NSDate) -> Int {
        return NSCalendar.currentCalendar().components(NSCalendarUnit.Second, fromDate: date, toDate: self, options: NSCalendarOptions.MatchLast).second
    }
}