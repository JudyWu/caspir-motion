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
    dynamic var creationDate = NSDate(timeIntervalSince1970: 1)
    dynamic var type = ""
    dynamic var content = ""
    
    
    //// Relationship
    dynamic var owner: Participant?
    
    
}
