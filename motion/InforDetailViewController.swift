//
//  InforDetailViewController.swift
//  motion
//
//  Created by Zhaoxin Wu on 4/28/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import UIKit

class InforDetailViewController: UIViewController {
    @IBOutlet weak var infoView: UIWebView!
    var url: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        self.infoView.loadRequest(request)
        
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
