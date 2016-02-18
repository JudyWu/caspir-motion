//
//  ReactionTask.swift
//  motion
//
//  Created by judywu on 12/25/15.
//  Copyright © 2015 CASPIR. All rights reserved.
//
import ResearchKit
import Foundation

public var ReactionTask: ORKOrderedTask {
     return ORKOrderedTask.reactionTimeTaskWithIdentifier("ReactionTask", intendedUseDescription: nil, maximumStimulusInterval: 10, minimumStimulusInterval: 1, thresholdAcceleration: 2.5, numberOfAttempts: 10, timeout: 4, successSound: 60, timeoutSound: 60, failureSound: 60, options: ORKPredefinedTaskOption.ExcludeAudio)
}
