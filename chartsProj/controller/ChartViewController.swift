//
//  ChartViewController.swift
//  chartsProj
//
//  Created by 陳仲堯 on 2018/10/22.
//  Copyright © 2018年 陳仲堯. All rights reserved.
//

import UIKit
import Charts

class ChartViewController: UIViewController {

    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var pieChartView: PieChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0]
    
        setChart(dataPoints: months, values: unitsSold)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        var dataEntries2: [ChartDataEntry] = []
        
        let unitsSold2 = [10.0, 8.0, 6.0, 4.0, 2.0, 6.0]
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: unitsSold2[i])
            dataEntries2.append(dataEntry)
        }
        
        // Set line chart data
        let lineChartDataSet = LineChartDataSet(values: dataEntries, label: "Units Sold")
        let lineChartDataSet2 = LineChartDataSet(values: dataEntries2, label: "Units Sold")
        
        lineChartDataSet2.setColor(UIColor(red: CGFloat(155/255), green: CGFloat(1/255), blue: CGFloat(1/255), alpha: 1))
        lineChartDataSet2.setCircleColor(UIColor(red: CGFloat(155/255), green: CGFloat(1/255), blue: CGFloat(1/255), alpha: 1))
        
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        lineChartData.addDataSet(lineChartDataSet2)
        
        lineChartView.data = lineChartData
        
        // Set pie chart data
        let pieChartDataSet = PieChartDataSet(values: dataEntries, label: "Units Sold")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        
        pieChartView.data = pieChartData
        
        // Set pie chart data color
        var colors: [UIColor] = []
        
        for _ in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        
        pieChartDataSet.colors = colors
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
