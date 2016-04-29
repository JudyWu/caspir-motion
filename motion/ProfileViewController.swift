/*
Copyright (c) 2015, Apple Inc. All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1.  Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2.  Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation and/or
other materials provided with the distribution.

3.  Neither the name of the copyright holder(s) nor the names of any contributors
may be used to endorse or promote products derived from this software without
specific prior written permission. No license is granted to the trademarks of
the copyright holders even if such marks are included in this software.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import UIKit
import ResearchKit
import HealthKit

enum HelpInfo: Int {
    case SAMHSA = 0
    case MarijuanaAnonymous
    case AlcoholicsAnonymous
    case SmartRecovery
    case ModerationManagement
    
    var title: String {
        switch self {
        case .SAMHSA:
            return "SAMHSA Treatment finder"
        case .MarijuanaAnonymous:
            return "Marijuana Anonymous"
        case .AlcoholicsAnonymous:
            return "Alcoholics Anonymous"
        case .SmartRecovery:
            return "Smart Recovery"
        case .ModerationManagement:
            return "Moderation Management"
        }
    }
    
    var url: String {
        switch self {
        case .SAMHSA:
            return "https://findtreatment.samhsa.gov/"
        case .MarijuanaAnonymous:
            return "https://www.marijuana-anonymous.org/"
        case .AlcoholicsAnonymous:
            return "http://www.aa.org/"
        case .SmartRecovery:
            return "http://www.smartrecovery.org/"
        case .ModerationManagement:
            return "http://www.moderation.org/"
        }
    }
}
class ProfileViewController: UITableViewController{
    // MARK: Properties
    @IBOutlet weak var applicationNameLabel: UILabel!
    @IBOutlet weak var participantNameLabel: UILabel!
    
    var result: ORKResult?
    let helpInfo = [HelpInfo.SAMHSA, HelpInfo.MarijuanaAnonymous, HelpInfo.AlcoholicsAnonymous, HelpInfo.SmartRecovery, HelpInfo.ModerationManagement]

    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: UITableViewDataSource
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Outside Resources"
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
   
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return helpInfo.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(ProfileStaticTableViewCell.reuseIdentifier, forIndexPath: indexPath) as? ProfileStaticTableViewCell else {
             fatalError("Unable to dequeue a ProfileStaticTableViewCell")
        }
    
        let taskRow = helpInfo[indexPath.row]
        cell.extraInfoTitle.text = taskRow.title
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showInfoDetail") {
            let nextScene = segue.destinationViewController as! InforDetailViewController
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let infoURL = helpInfo[indexPath.row].url
                nextScene.url = infoURL
            }
            
        }
    }
}

