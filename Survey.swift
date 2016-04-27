//
//  Survey.swift
//  motion
//
//  Created by Zhaoxin Wu on 4/14/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import Foundation
import RealmSwift

class Survey: Object {
    //// Properties
    dynamic var ID = "" //unique ID
    dynamic var name = "" // Identifier of the task controller
    dynamic var drugType = "" // either alcohol or smoke/vape
    dynamic var catergoryType = ""  // either baseline, daily or event
    dynamic var taskUUID = ""
    dynamic var creationDate = NSDate()
    
    /// variables on the surveys alcohol
    dynamic var aImportance = 0 //baseline importance 
    
    dynamic var heavyDrinkingDay = 0 //onboarding task
    dynamic var dailyHeavyDrinkingDay = "" //Yes or no
    dynamic var totalDrinking = 0 //daily total drinking
    dynamic var aLocation = 0 //
    dynamic var aLimitation = "" // either Yes or No
    
    dynamic var aIntoxication = 0
    
    
    /// variables on the surveys smoke
    dynamic var sImportance = 0 //baseline importance
    dynamic var smokeDay = 0 //onboarding task
    dynamic var didSmokeDay = ""
    dynamic var sIntoxicationAM = 0 // daily high question
    dynamic var sLocation = 0
    dynamic var sLimitation = "" // either Yes or No
    
    dynamic var sIntoxication = 0
    
    //// Relationship 
    dynamic var owner : Participant!
    
}
