//
//  TappingTask.swift
//  motion
//
//  Created by judywu on 12/25/15.
//  Copyright © 2015 CASPIR. All rights reserved.
//
import ResearchKit
import Foundation

public var TappingTask: ORKOrderedTask {
    return ORKOrderedTask.twoFingerTappingIntervalTaskWithIdentifier("TappingTask", intendedUseDescription: nil, duration: 10, options: ORKPredefinedTaskOption.ExcludeAccelerometer)
}



