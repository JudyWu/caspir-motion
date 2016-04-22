//
//  BaselineTableViewCell.swift
//  motion
//
//  Created by Zhaoxin Wu on 4/14/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import UIKit
import ResearchKit

class BaselineTableViewCell: UITableViewCell {
    static let reuseIdentifier = "BaselineTableViewCell"

    @IBOutlet weak var taskTitle: UILabel!
    
    @IBOutlet weak var taskDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
