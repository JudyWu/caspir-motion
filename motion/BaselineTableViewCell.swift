//
//  BaselineTableViewCell.swift
//  motion
//
//  Created by Zhaoxin Wu on 4/14/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import UIKit
import ResearchKit

class BaselineTableViewCell: UITableViewCell {
    static let reuseIdentifier = "BaselineTableViewCell"

    @IBOutlet weak var taskTitle: UILabel!
    
    @IBOutlet weak var taskDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}



//struct AllBaselineTasks {
//    static let tappingTask: ORKTask = {
//        let intendedUseDescription = "Finger tapping is a universal way to communicate."
//        return ORKOrderedTask.twoFingerTappingIntervalTaskWithIdentifier("BaselineTappingIntervalTask", intendedUseDescription: intendedUseDescription, duration: 10, options: ORKPredefinedTaskOption.None)
//    }()
//    
//    static let reactionTask: ORKTask = {
//        let intendedUseDescription = "See how fast you react to the dot"
//        
//        return ORKOrderedTask.reactionTimeTaskWithIdentifier("BaselineReactionTimeTask", intendedUseDescription: intendedUseDescription, maximumStimulusInterval: 10, minimumStimulusInterval: 4, thresholdAcceleration: 0.5, numberOfAttempts: 3, timeout: 3, successSound: UInt32(kAudioServicesPropertyCompletePlaybackIfAppDies), timeoutSound: 0, failureSound: UInt32(kSystemSoundID_Vibrate), options: [])
//    }()
//    
//    static let goNoGoTask: ORKTask = {
//        let intendedUseDescription = "For accessing your implusivity"
//        return ORKOrderedTask.toneAudiometryTaskWithIdentifier("BaselineGoNoGoTask", intendedUseDescription: intendedUseDescription, speechInstruction: nil, shortSpeechInstruction: nil, toneDuration: 20, options: [])
//        
//    }()
//    
//    static let balloonTask: ORKTask = {
//        return ORKOrderedTask.PSATTaskWithIdentifier("dfjlksdfjsdkl", intendedUseDescription: "For accessing your implusivity", presentationMode: ORKPSATPresentationMode.Auditory.union(.Visual), interStimulusInterval: 3.0, stimulusDuration: 1.0, seriesLength: 60, options: [])
//    }()
//
//}