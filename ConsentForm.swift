//
//  Onboarding.swift
//  motion
//
//  Created by Zhaoxin Wu on 4/14/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import Foundation
import RealmSwift

class ConsentForm: Object {
    //// Properties 
    dynamic var ID = "" // Unique ID
    dynamic var name = "" // Identifier of the task controller
    dynamic var drugType = "" //Either alcohol, smoke/vape or both
    dynamic var heavyDrinkingDay = 0 //from the eligibility form
    dynamic var smokeDay = 0 // from the eligibility form
    dynamic var creationDate = NSDate() 
    
    //// Relationship
    dynamic var owner: Participant!
    
    
 
}
