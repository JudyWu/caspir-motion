//
//  ConsentStep.swift
//  motion
//
//  Created by Zhaoxin Wu on 4/14/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import UIKit
import ResearchKit

class ConsentStep: ORKInstructionStep {
    override init(identifier: String) {
        super.init(identifier: identifier)
        
        title = NSLocalizedString("Consent Here", comment: "")
        text = NSLocalizedString("Please complete the following consent step in the websitejjfksjfklsdjfklsfjksljfsfjkjsdklfjdskfjskdfjjkdhfjsdhfjahsdfjkhasjfhasjkfhjsadhfsjdfhfjlfjsdlfjsldkfjskdfsdkfjsdfkjdkfjkfjaksjfdjfkdjfksajfklsajdfklsjfkjsdfkjsdkfjsdlkfjskfjsfkjsfjsfjskfjsdfjfjdkfjskfjksjksjfkdjfklsjflksfjslkfjlkfjkldfjsklfjsklfjskfljsfsjfkdjflgjjdglkjfksdjfksdjkjsdkjdgkljkgjkljfkjdkjfgjgldjgkjdfgjdfklgjdlgjalkgjdklgjdklfgjdklgjdklfgjdklgjdjgjsgjdkjkfjgdklfgjlkgjlkgjklfjgkfdjgkdgjdkgjkgjdkgjdkgjgjgfkjiufijgjfgkjfdkgjkdjslkdjskljklsjdklfsjfkdsjskdgjdkgjdkgjdfkjgkfjgkjgkdjgkfgjgjdgjgjdfjgdjfdjgflgjlkgsdjflkjgkldfjgdklfgjdljskljgkldjgdlkjgkdlfjgdkljgdkljgdkljgdkjdlgjdlgjkldjgdkljsjslkjfdkjfuewodjlfjksjflsfjslfjsurwerfjskjflksjfsruqrefsjfjsfjsfjsfjkfjskfjsfsfjkdjfjdkfjskfjksjksjfkdjfklsjflksfjslkfjlkfjkldfjsklfjsklfjskfljsfsjfkdjflgjjdglkjfksdjfksdjkjsdkjdgkljkgjk", comment: "")
        

    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
