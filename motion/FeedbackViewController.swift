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
    @IBOutlet weak var thirtyDaysFeedbackText: UITextView!
    
    @IBAction func feedbackButtonTapped(sender: UIButton) {
        let feedbackAlertController = UIAlertController(title: "Thank you", message: "We will take into your feedback to improve our care.", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) {(action: UIAlertAction) in
            print("You cliced on the cancel button")
        }
        feedbackAlertController.addAction(cancelAction)
        let OKAction = UIAlertAction(title: "OK", style: .Default) {(action: UIAlertAction) in
            print("You clicked on the OK button")
        }
        feedbackAlertController.addAction(OKAction)
        presentViewController(feedbackAlertController, animated: true, completion: nil)
    }
    
    func updateBaselineFeedback() {
        let prefs = NSUserDefaults.standardUserDefaults()
        let drugType = prefs.stringForKey("drugType")!
        let participantID = prefs.stringForKey("participantID")!
        
        let realm = try! Realm()
        let currentParticipant = realm.objects(Participant).filter("ID = '\(participantID)'").first!

        if drugType == "Alcohol" {
            let aImportance = currentParticipant.surveys.filter("name = 'BSAlcoholSurvey'").first!.aImportance
            let heavyDrinkingDay = currentParticipant.consentForm.heavyDrinkingDay
            
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

        } else if drugType == "Smoke/Vape" {
            let sImportance = currentParticipant.surveys.filter("name = 'BSSVSurvey'").first?.sImportance
            let smokeDay = currentParticipant.consentForm.smokeDay
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
        } else {
            let aImportance = currentParticipant.surveys.filter("name = 'BSAlcoholSurvey'").first?.aImportance
            let heavyDrinkingDay = currentParticipant.consentForm.heavyDrinkingDay
            
            var alcoholFeedback = ""
            
            if heavyDrinkingDay <= 5 {
               alcoholFeedback = Feedbacks.BaselineAlcoholFeedback1.content
            } else if heavyDrinkingDay > 5 && heavyDrinkingDay < 15 {
                if aImportance < 3 {
                   alcoholFeedback = Feedbacks.BaselineAlcoholFeedback2.content
                } else {
                   alcoholFeedback = Feedbacks.BaselineAlcoholFeedback3.content
                }
            } else {
                alcoholFeedback = Feedbacks.BaselineAlcoholFeedback4.content
            }
            
            var smokeFeedback = ""
            let sImportance = currentParticipant.surveys.filter("name = 'BSSVSurvey'").first?.sImportance
            let smokeDay = currentParticipant.consentForm.smokeDay
            if smokeDay <= 8 {
               smokeFeedback = Feedbacks.BaselineSVFeedback1.content
            } else if smokeDay > 8 && smokeDay < 15 {
                if sImportance < 3 {
                    smokeFeedback = Feedbacks.BaselineSVFeedback2.content
                } else {
                    smokeFeedback = Feedbacks.BaselineSVFeedback3.content
                }
            }else {
                smokeFeedback = Feedbacks.BaselineSVFeedback4.content
            }
            baselineFeedbackText.text = "Alcohol: " + alcoholFeedback + " Smoke/Vape: " + smokeFeedback
        }
    }
    
    func updateThirtyDayFeedback() {
//        leftDays = 30 - (timeInterval! - rounds!*30)
        let prefs = NSUserDefaults.standardUserDefaults()
        let drugType = prefs.stringForKey("drugType")
        let participantID = prefs.stringForKey("participantID")!
        
        let realm = try! Realm()
        let currentParticipant = realm.objects(Participant).filter("ID = '\(participantID)'").first
        
        if drugType == "Alcohol" {
            let alcoholSurveyNumber = currentParticipant?.surveys.filter("name = 'DSAlcoholSurvey'").count
            let heavyDayNumber = currentParticipant?.surveys.filter("name = 'DSAlcoholSurvey'").filter("dailyHeavyDrinkingDay = 'Yes'").count
            let alcoholPrecentage = round(Double(heavyDayNumber!/alcoholSurveyNumber!)*100)
            
            self.thirtyDaysFeedbackText.text = "You completed your survey on \(alcoholSurveyNumber) days. On the days you completed your survey you reported drinking heavily \(alcoholPrecentage)% of the days. Below are some graphs that show how your drinking is affected by other things in your life. We hope it gives you a greater understanding into your patterns and helps you make insightful choices about your use. Remember you can contact if you are interested in obtaining more information."

        } else if drugType == "Smoke/Vape" {
            let SVSurveyNumber = currentParticipant?.surveys.filter("name = 'DSSVSurvey'").count
            let smokeDayNumber = currentParticipant?.surveys.filter("name = 'DSSVSurvey'").filter("didSmokeDay = 'Yes'").count
           
            self.thirtyDaysFeedbackText.text = "You completed your survey on \(SVSurveyNumber) days and smoked on \(smokeDayNumber) of those days. Below are some graphs that show how your smoking is affected by other things in your life. We hope it gives you a greater understanding into your patterns and helps you make insightful choices about your use. Remember you can contact if you are interested in obtaining more information."
          
        } else {
            let alcoholSurveyNumber = currentParticipant?.surveys.filter("name = 'DSAlcoholSurvey'").count
            let heavyDayNumber = currentParticipant?.surveys.filter("name = 'DSAlcoholSurvey'").filter("dailyHeavyDrinkingDay = 'Yes'").count
            let alcoholPrecentage = round(Double(heavyDayNumber!/alcoholSurveyNumber!)*100)
            
            let alcoholFeedback = "You completed your survey on \(alcoholSurveyNumber) days. On the days you completed your survey you reported drinking heavily \(alcoholPrecentage)% of the days. Below are some graphs that show how your drinking is affected by other things in your life. We hope it gives you a greater understanding into your patterns and helps you make insightful choices about your use. Remember you can contact if you are interested in obtaining more information."

            let SVSurveyNumber = currentParticipant?.surveys.filter("name = 'DSSVSurvey'").count
            let smokeDayNumber = currentParticipant?.surveys.filter("name = 'DSSVSurvey'").filter("didSmokeDay = 'Yes'").count
            
            let smokeFeedback = "You completed your survey on \(SVSurveyNumber) days and smoked on \(smokeDayNumber) of those days. Below are some graphs that show how your smoking is affected by other things in your life. We hope it gives you a greater understanding into your patterns and helps you make insightful choices about your use. Remember you can contact if you are interested in obtaining more information."
            
            self.thirtyDaysFeedbackText.text = "Alcohol: " + alcoholFeedback + " Smoke/Vape: " + smokeFeedback
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