//
//  ResetPasswordController.swift
//  motion
//
//  Created by judywu on 3/2/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import UIKit

class ResetPasswordController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailMessageLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBAction func resetPassword(sender: UIButton) {
        self.sendPassword()
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpAppearance()
        self.emailMessageLabel.alpha = 0

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.row == 0 {
            self.emailTextField.becomeFirstResponder()
        }
    }
    
    
    func setUpAppearance() {
        let customizedColor = UIColor(red: 59.0/255.0, green: 147.0/255.0, blue: 144.0/255.0, alpha: 1.0)
        self.emailTextField.textColor = UIColor.blackColor()
        self.emailTextField.font = UIFont.boldSystemFontOfSize(17.0)
        self.resetButton.backgroundColor = UIColor.clearColor()
        self.resetButton.layer.cornerRadius = 5
        self.resetButton.layer.borderWidth = 1
        self.resetButton.layer.borderColor =
         customizedColor.CGColor
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.sendPassword()
        return true
    }
    
    func isContentValid(var errorMessage: String) -> Bool {
        var isContentValid: Bool = false
        if (self.emailTextField.text?.characters.count) == 0 {
            errorMessage = "Please enter your email address."
            isContentValid = false
        }else {
            isContentValid = true
        }
        return isContentValid
    }

    func sendPassword() {
        var error = "No error"
        if self.isContentValid(error) {
            if self.emailTextField.text!.isEmail {
                var emailAddress: String = self.emailTextField.text!
                UIView.animateWithDuration(1.0, animations: {() -> Void in
                    self.emailMessageLabel.text = NSLocalizedString("An email has been sent.", comment: "")
                    self.emailMessageLabel.alpha = 1
                    self.resetButton.alpha = 0
                    }, completion: {(finished: Bool) -> Void in
                        self.performSelector("dismiss", withObject: nil, afterDelay: 1.0)
                })
            }else {
                UIView.animateWithDuration(0.2, animations: {
                    self.emailMessageLabel.text = NSLocalizedString("Please enter a valid email address", comment: "")
                    self.emailMessageLabel.alpha = 1
                })
            }
        }else {
            UIView.animateWithDuration(0.2, animations: {
                self.emailMessageLabel.text = NSLocalizedString("Please enter a valid email address", comment: "")
                self.emailMessageLabel.alpha = 1
            })
            
        }
        
    }
    
    func dismiss() -> Void {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }
//
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension String {
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
        let emailTest  = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(self)
    }
}

