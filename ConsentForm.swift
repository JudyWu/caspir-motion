//
//  ConsentForm.swift
//  motion
//
//  Created by Zhaoxin Wu on 4/14/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import Foundation
import RealmSwift

class ConsentForm: Object {
    //// Properties 
    dynamic var ID = ""
    dynamic var name = ""
    dynamic var creationDate = NSDate(timeIntervalSince1970: 1)
    dynamic var steps = []
    
    //// Relationship
    dynamic var owner: Participant?
    
    
 
}
