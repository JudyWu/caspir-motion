//
//  IneligibleViewController.swift
//  motion
//
//  Created by judywu on 3/5/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import ResearchKit

class IneligibleViewController: ORKInstructionStepViewController {
    override func goForward() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

extension ORKInstructionStepViewController {
    func updateNavRightBarButtonItem() {
        self.navigationItem.rightBarButtonItem = nil
    }
}