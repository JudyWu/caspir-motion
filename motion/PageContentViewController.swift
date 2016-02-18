//
//  PageContentViewController.swift
//  motion
//
//  Created by judywu on 1/25/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {

    @IBOutlet weak var contentView: UIWebView!
    
    var pageIndex: Int?
    var contentLink: String?
    let url = "http://apple.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.contentView = NSURL(string: contentLink!)
        let requestURL = NSURL(string: url)
        let request = NSURLRequest(URL: requestURL!)
        contentView.loadRequest(request)

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
