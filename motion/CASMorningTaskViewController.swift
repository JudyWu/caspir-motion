//
//  CASMorningTaskViewController.swift
//  motion
//
//  Created by judywu on 3/21/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import UIKit
import ResearchKit

class CASMorningTaskViewController: ORKInstructionStepViewController {
    
    override func goForward() {
        let intendedUseDescription = "Finger tapping is a universal way to communicate."
        
        let orderedTask = ORKOrderedTask.twoFingerTappingIntervalTaskWithIdentifier("TappingIntervalTask", intendedUseDescription: intendedUseDescription, duration: 10, options: ORKPredefinedTaskOption.None)
        let taskViewController = ORKTaskViewController(task: orderedTask, taskRunUUID: nil)
//        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
       
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

//extension CASMorningTaskViewController: ORKTaskViewControllerDelegate {
//    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
//        self.dismissViewControllerAnimated(true, completion: nil)
//    }
//}
