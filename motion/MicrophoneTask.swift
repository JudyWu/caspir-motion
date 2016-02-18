//
//  MicrophoneTask.swift
//  motion
//
//  Created by judywu on 12/20/15.
//  Copyright © 2015 CASPIR. All rights reserved.
//
import ResearchKit

import Foundation

public var MicrophoneTask: ORKOrderedTask {
    return ORKOrderedTask.audioTaskWithIdentifier("AudioTask", intendedUseDescription: "A sentence prompt will be given to you to read.", speechInstruction: "These are the last dying words of Joseph of Aramathea", shortSpeechInstruction: "The Holy Grail can be found in the Castle of Aaaaaaaaaaah", duration: 10, recordingSettings: nil, options: ORKPredefinedTaskOption.ExcludeAccelerometer )
}