//
//  Task.swift
//  motion
//
//  Created by Zhaoxin Wu on 4/14/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import Foundation
import RealmSwift

class Task: Object {
    //// Properties
    dynamic var ID = ""
    dynamic var name = ""
    dynamic var taskUUID = ""
    dynamic var drugType = ""
    dynamic var catergoryType = ""
    dynamic var taskType = ""
    dynamic var creationDate = NSDate()
    dynamic var reactionTime : Float = 0.0
    
    //// Relationship
    dynamic var owner: Participant!
    
    
    
    
}
