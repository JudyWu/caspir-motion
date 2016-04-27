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
    case InPersonTherapy = 0
    case SMSModeration
    case ReadingMaterials
    
    var title: String {
        switch self {
        case .InPersonTherapy:
            return "In Person Therapy"
        case .SMSModeration:
            return "SMS Feedback"
        case .ReadingMaterials:
            return "Reading"
        }
    }
    
    var description: String {
        switch self {
        case .InPersonTherapy:
            return "flskdfjlkjfdlksjfksldjflskdajflkajdf"
        case .SMSModeration:
            return "flskfdsjfkdlsfjlskfjslkfjsdklfjsdfs"
        case .ReadingMaterials:
            return "lfflkdjfskfjksfjsdfjsdklfasdfsfsdfda"
        }
    }
    
    var logoImage: UIImage {
        switch self {
        case .InPersonTherapy:
            return UIImage(named: "telehealth_tag")!
        case .SMSModeration:
            return UIImage(named: "red")!
        case .ReadingMaterials:
            return UIImage(named: "blue")!
        }
    }
}

class ProfileViewController: UITableViewController{
    // MARK: Properties
    @IBOutlet weak var applicationNameLabel: UILabel!
    @IBOutlet weak var participantNameLabel: UILabel!
    
    var result: ORKResult?
    let helpInfo = [HelpInfo.InPersonTherapy, HelpInfo.ReadingMaterials, HelpInfo.SMSModeration]

    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        
    }
    
    // MARK: UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return helpInfo.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(ProfileStaticTableViewCell.reuseIdentifier, forIndexPath: indexPath) as? ProfileStaticTableViewCell else {
             fatalError("Unable to dequeue a ProfileStaticTableViewCell")
        }
    
        let taskRow = helpInfo[indexPath.row]
        cell.infoTitle.text = taskRow.title
        cell.infoDescription.text = taskRow.description
        cell.infoImage.image = taskRow.logoImage
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MARK: Cell configuration

    // MARK: Convenience
}

