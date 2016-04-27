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
    dynamic var ID = ""   //User ID for tracing back data
    dynamic var passcode = "" // Connect the consent form in other database
    dynamic var startDate = NSDate()  // the date when user completes the baseline measurement
    dynamic var creationDate = NSDate() // the date when user completes onboarding process
    dynamic var drugType = "" // either alcohol, smoke/vape or both
    dynamic var consentForm : ConsentForm!

    //// Relationship
    let surveys = List<Survey>()
    let tasks = List<Task>()
    let feedbacks = List<Feedback>() //baseline and 30 days feedback
}
