//
//  StatisticViewController.swift
//  FoodTaskerMobile
//
//  Created by Leo Trieu on 9/25/16.
//  Copyright © 2016 Leo Trieu. All rights reserved.
//

import UIKit
import Charts

class StatisticViewController: UIViewController {

    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    @IBOutlet weak var viewChart: BarChartView!
    
    var weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuBarButton.target = self.revealViewController()
            menuBarButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        // #1 Initialize chart
        self.initializeChart()
        
        // #2 Load data to chart
        self.loadDataToChart()

    }
    
    func initializeChart() {
        
        viewChart.noDataText = "No Data"
        viewChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInBounce)
        viewChart.xAxis.labelPosition = .bottom
        viewChart.descriptionText = ""
        viewChart.xAxis.setLabelsToSkip(0)
        
        viewChart.legend.enabled = false
        viewChart.scaleYEnabled = false
        viewChart.scaleXEnabled = false
        viewChart.pinchZoomEnabled = false
        viewChart.doubleTapToZoomEnabled = false
        
        viewChart.leftAxis.axisMinValue = 0.0
        viewChart.leftAxis.axisMaxValue = 100.00
        viewChart.highlighter = nil
        viewChart.rightAxis.enabled = false
        viewChart.xAxis.drawGridLinesEnabled = false
        
    }
    
    func loadDataToChart() {
    
        APIManager.shared.getDriverRevenue { (json) in
            
            if json != nil {
                
                let revenue = json["revenue"]
                
                var dataEntries: [BarChartDataEntry] = []
                
                for i in 0..<self.weekdays.count {
                    let day = self.weekdays[i]
                    let dataEntry = BarChartDataEntry(value: revenue[day].double!, xIndex: i)
                    dataEntries.append(dataEntry)
                }
                
                let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Revenue by day")
                chartDataSet.colors = ChartColorTemplates.material()
                
                let chartData = BarChartData(xVals: self.weekdays, dataSet: chartDataSet)
                
                self.viewChart.data = chartData
                
            }
        }
    }

}
