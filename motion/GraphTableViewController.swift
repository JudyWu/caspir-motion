//  GraphTableViewController.swift
//  motion
//
//  Created by Zhaoxin Wu on 4/27/16.
//  Copyright © 2016 CASPIR. All rights reserved.
//

import UIKit
import ResearchKit
import RealmSwift

class GraphTableViewController: UITableViewController {
    var chartTableViewCells: [UITableViewCell]!
    
    let alcoholLocationTableViewCellIdentifier = "AlcoholLocationChartCell"
    let alcoholLimitationTableViewCellIdentifier = "AlcoholLimitationChartCell"
    let smokeLocationTableViewCellIdentifier = "SmokeLocationChartCell"
    let smokeLimitationTableViewCellIdentifier = "SmokeLimitationChartCell"
    
    var alcoholLocationTableViewCell: AlcoholLocationTableViewCell!
    var alcoholLimitationTableViewCell: AlcoholLimitationTableViewCell!
    var smokeLocationTableViewCell: SmokeLocationTableViewCell!
    var smokeLimitationTableViewCell: SmokeLimitationTableViewCell!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        generateGraphs()
        ///Drinking vs. Location
        let prefs = NSUserDefaults.standardUserDefaults()
        let drugType = prefs.stringForKey("drugType")
    
        if drugType == "Alcohol" {
            chartTableViewCells = [alcoholLocationTableViewCell, alcoholLimitationTableViewCell]
        } else if drugType == "Smoke/Vape" {
            chartTableViewCells = [smokeLocationTableViewCell, smokeLimitationTableViewCell]
        } else {
            chartTableViewCells = [alcoholLocationTableViewCell, alcoholLimitationTableViewCell, smokeLocationTableViewCell, smokeLimitationTableViewCell]
        }
        self.tableView.reloadData()
        
        alcoholLocationTableViewCell.graphView.animateWithDuration(0.5)
        alcoholLimitationTableViewCell.graphView.animateWithDuration(0.5)
        smokeLocationTableViewCell.graphView.animateWithDuration(0.5)
        smokeLimitationTableViewCell.graphView.animateWithDuration(0.5)
//        tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
    func generateGraphs() {
        let alcoholLocationDataSource = AlcoholLocationDataSource()
        let alcoholLimitationDataSource = AlcoholLimitationDataSource()
        let smokeLocationDataSource = SmokeLocationDataSource()
        let smokeLimitationDataSource = SmokeLimicationDataSource()
        
        alcoholLocationTableViewCell = tableView.dequeueReusableCellWithIdentifier(alcoholLocationTableViewCellIdentifier) as! AlcoholLocationTableViewCell
        let alcoholLocationChartView = alcoholLocationTableViewCell.graphView as ORKDiscreteGraphChartView
        alcoholLocationChartView.dataSource = alcoholLocationDataSource
        alcoholLocationChartView.tintColor = CustomizedColors.GrayColor.colorCode
        alcoholLocationChartView.showsHorizontalReferenceLines = true
        alcoholLocationChartView.showsVerticalReferenceLines = true
        
        //// Drinking vs. Limitation
        alcoholLimitationTableViewCell = tableView.dequeueReusableCellWithIdentifier(alcoholLimitationTableViewCellIdentifier) as! AlcoholLimitationTableViewCell
        let alcoholLimitationChartView = alcoholLimitationTableViewCell.graphView as ORKDiscreteGraphChartView
        alcoholLimitationChartView.dataSource = alcoholLimitationDataSource
        alcoholLimitationChartView.tintColor = CustomizedColors.PinkColor.colorCode
        alcoholLimitationChartView.showsHorizontalReferenceLines = true
        alcoholLimitationChartView.showsVerticalReferenceLines = true
        
        /// Smoking vs. Location
        smokeLocationTableViewCell = tableView.dequeueReusableCellWithIdentifier(smokeLocationTableViewCellIdentifier) as! SmokeLocationTableViewCell
        let smokeLocationChartView = smokeLocationTableViewCell.graphView as ORKDiscreteGraphChartView
        smokeLocationChartView.dataSource = smokeLocationDataSource
        smokeLocationChartView.tintColor = CustomizedColors.BlueColor.colorCode
        smokeLocationChartView.showsHorizontalReferenceLines = true
        smokeLocationChartView.showsVerticalReferenceLines = true
        
        /// Smoking vs. Limitation
        smokeLimitationTableViewCell = tableView.dequeueReusableCellWithIdentifier(smokeLimitationTableViewCellIdentifier) as! SmokeLimitationTableViewCell
        let smokeLimitationChartView = smokeLimitationTableViewCell.graphView as ORKDiscreteGraphChartView
        smokeLimitationChartView.dataSource = smokeLimitationDataSource
        smokeLimitationChartView.tintColor = CustomizedColors.OrangeColor.colorCode
        smokeLimitationChartView.showsHorizontalReferenceLines = true
        smokeLimitationChartView.showsVerticalReferenceLines = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chartTableViewCells.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = chartTableViewCells[indexPath.row];
        return cell
    }
}