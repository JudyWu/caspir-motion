//
//  GraphTableViewCell.swift
//  motion
//
//  Created by Zhaoxin Wu on 4/27/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import UIKit
import ResearchKit

class AlcoholLocationTableViewCell: UITableViewCell {

    @IBOutlet weak var graphView: AlcoholLocationChartView!
}

class AlcoholLimitationTableViewCell: UITableViewCell {

    @IBOutlet weak var graphView: AlcoholLimitationChartView!
    
}

class SmokeLocationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var graphView: SmokeLocationChartView!
}

class SmokeLimitationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var graphView: SmokeLimitationChartView!
}

/// Subclass of ORKDiscreteGraphChartView in order to get four charts
class AlcoholLocationChartView : ORKDiscreteGraphChartView {
    
}

class AlcoholLimitationChartView : ORKDiscreteGraphChartView {
    
}
class SmokeLimitationChartView : ORKDiscreteGraphChartView {
    
}
class SmokeLocationChartView : ORKDiscreteGraphChartView {
    
}
