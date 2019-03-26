//
//  ViewController.swift
//  ChartApp
//
//  Created by MLeber on 9/21/18.
//  Copyright © 2018 MLeber. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    @IBOutlet var chartView: LineChartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        chartView.dragEnabled = false
        chartView.setScaleEnabled(false)
        chartView.drawGridBackgroundEnabled = false
        chartView.minOffset = 0.0
        chartView.chartDescription = nil
        
        chartView.rightAxis.enabled = false
        chartView.leftAxis.enabled = false
        
        chartView.xAxis.enabled = false
        chartView.legend.enabled = false
        chartView.highlightPerTapEnabled = false
        chartView.legend.enabled = false
        
        self.populateData(withCount: 20)
    }
    
    func populateData(withCount count: Int) {
        let range = 0..<count
        let values = range.map { (i) -> ChartDataEntry in
            let value = arc4random_uniform(30) + 50
            let entry = ChartDataEntry(x: Double(i), y: Double(value))
            return entry
        }
        let valuesTwo = range.map { (i) -> ChartDataEntry in
            let value = arc4random_uniform(30) + 50
            let entry = ChartDataEntry(x: Double(i), y: Double(value))
            return entry
        }.dropLast(count/2)
        
        let set = LineChartDataSet(values: values, label: "ytd")
        set.setColor(#colorLiteral(red: 0.2980392157, green: 0.6196078431, blue: 0.1764705882, alpha: 1))
        set.lineWidth = 3.0
        set.mode = .cubicBezier
        set.drawCirclesEnabled = false
        set.drawHorizontalHighlightIndicatorEnabled = false
        set.drawValuesEnabled = false
        
        let setTwo = LineChartDataSet(values: Array(valuesTwo), label: "lytd")
        setTwo.setColor(#colorLiteral(red: 0.8117647059, green: 0.9019607843, blue: 0.6705882353, alpha: 1))
        setTwo.lineWidth = 3.0
        setTwo.mode = .cubicBezier
        setTwo.drawCirclesEnabled = false
        setTwo.drawHorizontalHighlightIndicatorEnabled = false
        setTwo.drawValuesEnabled = false
        
        let data = LineChartData(dataSets: [set, setTwo])
        chartView.data = data
    }
}

