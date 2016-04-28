///*
//Copyright (c) 2015, Apple Inc. All rights reserved.
//
//Redistribution and use in source and binary forms, with or without modification,
//are permitted provided that the following conditions are met:
//
//1.  Redistributions of source code must retain the above copyright notice, this
//list of conditions and the following disclaimer.
//
//2.  Redistributions in binary form must reproduce the above copyright notice,
//this list of conditions and the following disclaimer in the documentation and/or
//other materials provided with the distribution.
//
//3.  Neither the name of the copyright holder(s) nor the names of any contributors
//may be used to endorse or promote products derived from this software without
//specific prior written permission. No license is granted to the trademarks of
//the copyright holders even if such marks are included in this software.
//
//THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
//ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
//FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
//DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
//CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
//OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
//OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//*/
//
//import UIKit
//import ResearchKit
//import RealmSwift
//
//class DashboardTableViewController: UITableViewController {
//    // MARK: Properties
//    
//  
//    @IBOutlet var descreteGraph: ORKDiscreteGraphChartView!
//    @IBOutlet weak var graphTitle: UILabel!
//    
//    var allCharts: [UIView] {
////        if drugType == "Alcohol" {
////            return [aLocationGraph, aLimitationGraph]
////        } else if drugType == "Smoke/Vape" {
////            return [sLocationGraph, sLimitationGraph]
////        } else {
////            return [aLocationGraph, aLimitationGraph, sLocationGraph, sLimitationGraph]
////        }
//        return [pieChart, lineGraph]
//    }
//    
//
//    let descreteGraphDataSource = DiscreteGraphDataSource()
//    // MARK: UIViewController
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let prefs = NSUserDefaults.standardUserDefaults()
//        let drugType = prefs.stringForKey("drugType")
//        
//        // Set the data source for each graph
//        descreteGraph.dataSource = descreteGraphDataSource
//        
//        // Set the table view to automatically calculate the height of cells.
//        tableView.estimatedRowHeight = tableView.rowHeight
//        tableView.rowHeight = UITableViewAutomaticDimension
//    }
//
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        // Animate any visible charts
//        let visibleCells = tableView.visibleCells
//        let visibleAnimatableCharts = visibleCells.flatMap { animatableChartInCell($0) }
//        
//        for chart in visibleAnimatableCharts {
//            chart.animateWithDuration(0.5)
//        }
//    }
//    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return
//    }
//    
//    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//    }
//    // MARK: UITableViewDelegate
//    
//    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        // Animate charts as they're scrolled into view.
//        if let animatableChart = animatableChartInCell(cell) {
//            animatableChart.animateWithDuration(0.5)
//        }
//    }
//    
//    
//    
//    // MARK: Convenience
//    func animatableChartInCell(cell: UITableViewCell) -> AnimatableChart? {
//        for chart in allCharts {
//            guard let animatableChart = chart as? AnimatableChart where chart.isDescendantOfView(cell) else { continue }
//            return animatableChart
//        }
//        
//        return nil
//    }
//}
