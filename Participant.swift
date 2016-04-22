//
//  Participant.swift
//  motion
//
//  Created by Zhaoxin Wu on 4/14/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import Foundation
import RealmSwift

class Participant: Object {
    //// Properties
    dynamic var ID = ""
    dynamic var firstName = ""
    dynamic var lastName = ""
    dynamic var email = ""
    dynamic var password = ""
    dynamic var creationDate = NSDate(timeIntervalSince1970: 1)
    dynamic var drugType = ""
    dynamic var consentForm : ConsentForm?
    
    
    //// Relationship
    let surveys = List<Survey>()
    let tasks = List<Task>()
    let feedbacks = List<Feedback>()
//    let consentForm = List<ConsentForm>()
}
