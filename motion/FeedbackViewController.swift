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
    }
    
    override func viewWillAppear(animated: Bool) {
        nowTime = NSDate()
        timeInterval = nowTime!.secondsFrom(startDate!)
        updateBaselineFeedback()
        rounds = Int(floor(Double(timeInterval!) / 30))
        if timeInterval! % 30 >= 0 {
            updateThirtyDayFeedback()
            
        }
    }
    
    @IBOutlet weak var baselineFeedbackText: UITextView!
    @IBOutlet weak var thirtyDaysFeedbackText: UITextView!
    
    func updateBaselineFeedback() {
        /// Store the feedback in the database
        var baselineFeedback = realm.objects(Feedback).filter("name = ''").first
        
        baselineFeedback!.owner = currentParticipant
        
        self.baselineFeedbackText.text = "According tcoo your input, you intend to drink more on the days with you friend. My advise for you will be to stop hanging out too late at night with friends."
    }
    
    func updateThirtyDayFeedback() {
        leftDays = 30 - (timeInterval! - rounds!*30)
        
        if rounds >= 1 {
            self.thirtyDaysFeedbackText.text = "jksjflsjfskjksdjflksjfklsdjfdskjfksdjkfsjfksdjfksdjfksjdfksfkjskfjkdsjfksjkljkjjfdsjfksjk.  \(leftDays) more days left to see the feedback from clinicians. This is your # \(rounds! + 1) round of the study."
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