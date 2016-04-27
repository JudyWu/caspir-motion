//
//  Feedback.swift
//  motion
//
//  Created by Zhaoxin Wu on 4/14/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import Foundation
import RealmSwift

class Feedback: Object {
    dynamic var ID = ""
    dynamic var name = ""
    dynamic var creationDate = NSDate()
    dynamic var drugType = "" // Alcohol or smoke/vape
    dynamic var content = "" // the feedback text
    dynamic var timeType = "" ///Either baseline or 30 days
    
    
    //// Relationship
    dynamic var owner: Participant?
    
    
}
