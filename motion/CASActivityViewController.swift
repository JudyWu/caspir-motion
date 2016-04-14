//
//  CASActivityViewController.swift
//  motion
//
//  Created by judywu on 3/18/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import UIKit
import ResearchKit

class CASActivityViewController: UIViewController, ORKTaskViewControllerDelegate {
    let yourThoughtuuid = NSUUID().UUIDString
    
    var taskResultFinishedCompletionHandler: (ORKResult -> Void)?

    @IBOutlet weak var morningSurveyButton: UIButton!
    
    @IBOutlet weak var situationTaskButton: UIButton!

    @IBOutlet weak var yourThoughtButton: UIButton!
 
    @IBAction func moreThoughtsButtonTapped(sender: UIButton) {
        let thoughtAnswerFormat = ORKTextAnswerFormat(maximumLength: 125)
        thoughtAnswerFormat.multipleLines = true
        let thoughtQuestionStepTitle = "How do you feel today?"
        let thoughtQuestionStep = ORKQuestionStep(identifier: "ThoughtQuestionStep", title: thoughtQuestionStepTitle, answer: thoughtAnswerFormat)
        thoughtQuestionStep.optional = false
        let thoughtTask = ORKOrderedTask(identifier: "YourThought", steps: [thoughtQuestionStep])
        
        let taskViewController = ORKTaskViewController(task: thoughtTask, taskRunUUID: NSUUID(UUIDString: yourThoughtuuid))
        
        taskViewController.delegate = self
        taskViewController.outputDirectory = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!

        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
            taskResultFinishedCompletionHandler?(taskViewController.result)
            print("\(taskViewController.result)")
            dismissViewControllerAnimated(true, completion: nil)
    }
    
    func setUpAppearance() {
        let customizedColor = UIColor(red: 245.0/255.0, green: 102.0/255.0, blue: 79.0/255.0, alpha: 1.0)
        self.morningSurveyButton.backgroundColor = customizedColor
        self.morningSurveyButton.layer.cornerRadius = 10
        self.morningSurveyButton.layer.borderWidth = 1
        self.morningSurveyButton.layer.borderColor =
            customizedColor.CGColor
        
        self.situationTaskButton.backgroundColor = customizedColor
        self.situationTaskButton.layer.cornerRadius = 10
        self.situationTaskButton.layer.borderWidth = 1
        self.situationTaskButton.layer.borderColor =
            customizedColor.CGColor
        
        let themeColor = UIColor(red: 59.0/255.0, green: 147.0/255.0, blue: 144.0/255.0, alpha: 1.0)
        self.yourThoughtButton.backgroundColor = themeColor
        self.yourThoughtButton.layer.cornerRadius = 10
        self.yourThoughtButton.layer.borderWidth = 1
        self.yourThoughtButton.layer.borderColor =
            themeColor.CGColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAppearance()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
