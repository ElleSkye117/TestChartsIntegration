//
//  ViewController.swift
//  ChartApp
//
//  Created by MLeber on 9/21/18.
//  Copyright © 2018 MLeber. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet var chartView: LineChartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        chartView.delegate = self
        chartView.dragEnabled = false
        chartView.setScaleEnabled(true)
        chartView.drawGridBackgroundEnabled = false
        chartView.minOffset = 0.0
        chartView.chartDescription = nil
        
        chartView.rightAxis.enabled = false
        
        chartView.leftAxis.enabled = true
        chartView.leftAxis.drawGridLinesEnabled = true
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.leftAxis.labelPosition = .insideChart
        chartView.leftAxis.drawZeroLineEnabled = true
        chartView.leftAxis.drawLabelsEnabled = false
        chartView.leftAxis.labelCount = 2
      
        let limitLine = ChartLimitLine(limit: 19.0)
        limitLine.drawLabelEnabled = true
        limitLine.lineDashLengths = [5.0]
        limitLine.lineDashPhase = 1
        limitLine.drawLabelEnabled = true
        limitLine.labelPosition = .rightBottom
        limitLine.lineColor = #colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)
        chartView.xAxis.addLimitLine(limitLine)
        
        chartView.xAxis.enabled = true
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.drawLabelsEnabled = true
        chartView.xAxis.axisLineDashLengths = [5.0]
        chartView.xAxis.axisLineDashPhase = 1.0
        chartView.xAxis.labelCount = 12
        chartView.xAxis.drawLabelsEnabled = false
        chartView.xAxis.gridColor = #colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)
        chartView.xAxis.axisLineColor = #colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)
        chartView.xAxis.labelTextColor = #colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)
        chartView.xAxis.labelFont = UIFont(name: "ArialMT", size: 11.0)!
        
        chartView.legend.enabled = false
        
        self.populateData(withCount: 40)
    }
    
    func populateData(withCount count: Int) {
        let range = 0..<count
        let values = range.map { (i) -> ChartDataEntry in
            let value = arc4random_uniform(40) + 50
            let entry = ChartDataEntry(x: Double(i), y: Double(value))
            return entry
        }
        let valuesTwo = range.map { (i) -> ChartDataEntry in
            let value = arc4random_uniform(40) + 50
            let entry = ChartDataEntry(x: Double(i), y: Double(value))
            return entry
        }.dropLast(count/2)
        
        let set = LineChartDataSet(values: values, label: "ytd")
        set.setColor(#colorLiteral(red: 0.9137254902, green: 0.3882352941, blue: 0.3843137255, alpha: 1))
        set.lineWidth = 2.0
        set.mode = .linear
        set.drawCirclesEnabled = false
        set.drawHorizontalHighlightIndicatorEnabled = false
        set.drawValuesEnabled = false
        
        let setTwo = LineChartDataSet(values: Array(valuesTwo), label: "lytd")
        setTwo.setColor(#colorLiteral(red: 0.7019607843, green: 0.831372549, blue: 0.9882352941, alpha: 1))
        setTwo.lineWidth = 2.0
        setTwo.mode = .linear
        setTwo.drawCirclesEnabled = false
        setTwo.drawHorizontalHighlightIndicatorEnabled = false
        setTwo.drawValuesEnabled = false
        
        let data = LineChartData(dataSets: [set, setTwo])
        chartView.data = data
    }
}

