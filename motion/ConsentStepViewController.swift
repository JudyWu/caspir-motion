//
//  ConsentStepViewController.swift
//  motion
//
//  Created by Zhaoxin Wu on 4/14/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import UIKit
import ResearchKit


class ConsentStepViewController: ORKInstructionStepViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        /// Setting the UIVewbView 
        let url = "http://judywu.github.io/CAS-consent-form/"
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        let webView = UIWebView(frame: CGRectMake(0, 0,  self.view.frame.size.width, self.view.frame.size.height - 150))
        webView.loadRequest(request)
        self.view.addSubview(webView)
    }
    
    override func hasNextStep() -> Bool {
        return true
    }
    

    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        for subview in self.view.subviews {
            if subview is UIWebView {
                if toInterfaceOrientation == .LandscapeLeft || toInterfaceOrientation == .LandscapeRight {
                    subview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                } else {
                    subview.frame = CGRectMake(0, 0,  self.view.frame.size.width, self.view.frame.size.height - 80)
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
