//
//  CASInclusionCriteriaViewController.swift
//  motion
//
//  Created by judywu on 2/16/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//
import UIKit
import APCAppCore

class CASInclusionCriteriaViewController: APCInclusionCriteriaViewController, APCSegmentedButton {
    
    @IBOutlet weak var question1Label: UILabel!
    @IBOutlet weak var question1Option1: UIButton!
    @IBOutlet weak var question1Option2: UIButton!
    
    @IBOutlet weak var question2Label: UILabel!
    @IBOutlet weak var question2Option1: UIButton!
    @IBOutlet weak var question2Option2: UIButton!
    
    @IBOutlet weak var question3Label: UILabel!
    @IBOutlet weak var question3Option1: UIButton!
    @IBOutlet weak var question3Option2: UIButton!
    
    var questions: NSArray
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.questions = [
            APCSegmentedButton(buttons: [self.question1Option1, self.question1Option2], normalColor: UIColor.appSecondaryColor3(), hightlightColor: UIColor.appPrimaryColor()),
            APCSegmentedButton(buttons: [self.question2Option1, self.question2Option2], normalColor: UIColor.appSecondaryColor3(), highlightColor: UIColor.appPrimaryColor()),
            APCSegmentedButton(buttons: [self.question3Option1, self.question3Option2], normalColor: UIColor.appSecondaryColor3(), highlightColor: UIColor.appPrimaryColor())
        ]
        
        self.questions.enumerateObjectsUsingBlock({(obj: APCSegmentedButton, idx: NSInteger, stop: Bool) -> Void in
            obj.delegate = self
        })
        self.setUpAppearance()
        self.navigationItem.rightBarButtonItem.enabled = false
    }
    
    func setUpAppearance() {
        self.question1Label.textColor = UIColor.blackColor()
        self.question1Label.font = UIFont.appQuestionLabelFont()
        self.question1Option1.titleLabel.font = UIFont.appQuestionOptionFont()
        self.question1Option2.titleLabel.font = UIfont.appQuestionOptionFont()
        
        self.question2Label.textColor = UIColor.blackColor()
        self.question2Label.font = UIFont.appQuestionLableFont()
        self.question2Option1.titleLabel.font = UIFont.appQuestionOptionFont()
        self.question2Option2.titleLabel.font = UIFont.appQuestionOptionFont()
        
        self.question3Label.textColor = UIColor.blackColor()
        self.question3Label.font = UIFont.appQuestionLableFont()
        self.question3Option1.titleLabel.font = UIFont.appQuestionOptionFont()
        self.question3Option2.titleLabel.font = UIFont.appQuestionOptionFont()
    }
    
    func onboarding() -> APCOnboarding {
        return (UIApplication.sharedApplication().delegate as! CASAppDelegate).onboarding
    }
    
    func viewDidLayoutSubviews() {
        self.tableView.separatorInset = UIEdgeInsetsZero
        self.tableView.layoutMargins = UIEdgeInsetsZero
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.separatorInset = UIEdgeInsetsZero
        cell.layoutMargins = UIEdgeInsetsZero
    }
    
    func segmentedButtonPressed(__unused: UIButton) {
        self.navigationItem.rightBarButtonItem.enabled = self.isContentValid()
    }
    
    func next() {
        self.onboarding().onboardingTask.eligible = self.isEligible()
        var viewController: UIViewController = self.onboarding().nextScene()
        self.navigationController!.pushViewController(viewController, animated: true)
    }
    
    func isEligible() -> Bool {
        var retValue: Bool = true
        var question1: APCSegmentedButton = self.question[0]
        var question2: APCSegmentedButton = self.question[1]
        var question3: APCSegmentedButton = self.question[2]
        
        if (question1.selectedIndex == 1) || (question2.selectedIndex == 1) || (question3.selectedIndex == 1) {
            retValue == false
        }
        return retValue
    }
    
    func isContentValid() -> Bool {
        var retValue: Bool = true
        self.questions.enumerateObjectsUsingBlock({(obj: APCSegmentedButton, idx: NSUInteger, stop: Bool) -> Void in
            if obj.selectedIndex == -1 {
                retValue = false
                stop = true
            }
        })
        return retValue
    }
}


























