//
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
    
    let alcoholLocationDataSource = AlcoholLocationDataSource()
    let alcoholLimitationDataSource = AlcoholLimitationDataSource()
    let smokeLocationDataSource = SmokeLocationDataSource()
    let smokeLimitationDataSource = SmokeLimicationDataSource()
    
    let alcoholLocationTableViewCellIdentifier = "AlcoholLocationChartCell"
    let alcoholLimitationTableViewCellIdentifier = "AlcoholLimitationChartCell"
    let smokeLocationTableViewCellIdentifier = "SmokeLocationChartCell"
    let smokeLimitationTableViewCellIdentifier = "SmokeLimitationChartCell"
    
    var alcoholLocationTableViewCell: AlcoholLocationTableViewCell!
    var alcoholLimitationTableViewCell: AlcoholLimitationTableViewCell!
    var smokeLocationTableViewCell: SmokeLocationTableViewCell!
    var smokeLimitationTableViewCell: SmokeLimitationTableViewCell!
    
    override func viewDidLoad() {
//        super.viewDidLoad()
        ///Drinking vs. Location
        alcoholLocationTableViewCell = tableView.dequeueReusableCellWithIdentifier(alcoholLocationTableViewCellIdentifier) as! AlcoholLocationTableViewCell
        let alcoholLocationChartView = alcoholLocationTableViewCell.graphView as ORKDiscreteGraphChartView
        alcoholLocationChartView.dataSource = alcoholLocationDataSource
        alcoholLocationChartView.tintColor = UIColor(red: 244/255, green: 190/255, blue: 74/255, alpha: 1)
        alcoholLocationChartView.showsHorizontalReferenceLines = true
        alcoholLocationChartView.showsVerticalReferenceLines = true
        
        //// Drinking vs. Limitation
        alcoholLimitationTableViewCell = tableView.dequeueReusableCellWithIdentifier(alcoholLimitationTableViewCellIdentifier) as! AlcoholLimitationTableViewCell
        let alcoholLimitationChartView = alcoholLimitationTableViewCell.graphView as ORKDiscreteGraphChartView
        alcoholLimitationChartView.dataSource = alcoholLimitationDataSource
        alcoholLimitationChartView.tintColor = UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1)
        alcoholLimitationChartView.showsHorizontalReferenceLines = true
        alcoholLimitationChartView.showsVerticalReferenceLines = true
        
        /// Smoking vs. Location
        smokeLocationTableViewCell = tableView.dequeueReusableCellWithIdentifier(smokeLocationTableViewCellIdentifier) as! SmokeLocationTableViewCell
        let smokeLocationChartView = smokeLocationTableViewCell.graphView as ORKDiscreteGraphChartView
        smokeLocationChartView.dataSource = smokeLocationDataSource
        smokeLocationChartView.tintColor = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
        smokeLocationChartView.showsHorizontalReferenceLines = true
        smokeLocationChartView.showsVerticalReferenceLines = true
        
        /// Smoking vs. Limitation
        smokeLimitationTableViewCell = tableView.dequeueReusableCellWithIdentifier(smokeLimitationTableViewCellIdentifier) as! SmokeLimitationTableViewCell
        let smokeLimitationChartView = smokeLimitationTableViewCell.graphView as ORKDiscreteGraphChartView
        smokeLimitationChartView.dataSource = smokeLimitationDataSource
        smokeLimitationChartView.tintColor = UIColor(red: 217/225, green: 217/255, blue: 217/225, alpha: 1)
        smokeLimitationChartView.showsHorizontalReferenceLines = true
        smokeLimitationChartView.showsVerticalReferenceLines = true

        chartTableViewCells = [alcoholLocationTableViewCell, alcoholLimitationTableViewCell, smokeLocationTableViewCell, smokeLimitationTableViewCell]
        tableView.tableFooterView = UIView(frame: CGRectZero)
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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        alcoholLocationTableViewCell.graphView.animateWithDuration(0.5)
        alcoholLimitationTableViewCell.graphView.animateWithDuration(0.5)
        smokeLocationTableViewCell.graphView.animateWithDuration(0.5)
        smokeLimitationTableViewCell.graphView.animateWithDuration(0.5)

        
    }
}