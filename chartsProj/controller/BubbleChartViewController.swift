//
//  BubbleChartViewController.swift
//  chartsProj
//
//  Created by 陳仲堯 on 2018/10/23.
//  Copyright © 2018年 陳仲堯. All rights reserved.
//

import UIKit
import Charts

class BubbleChartViewController: UIViewController {

    @IBOutlet weak var bubbleChartView: BubbleChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataSet = DataSet()
        setChart(dataPoints: dataSet.months, values: dataSet.data)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        var dataEntries: [BubbleChartDataEntry] = []
        var dataEntries2: [BubbleChartDataEntry] = []
        let unitsSold2 = [10.0, 8.0, 6.0, 4.0, 2.0, 6.0, 10.0, 8.0, 6.0, 4.0, 2.0, 6.0]
        
        
        for i in 0..<dataPoints.count {
            let dataEntry = BubbleChartDataEntry(x: Double(i), y: values[i], size: CGFloat(values[i]))
            dataEntries.append(dataEntry)
        }
        
        for i in 0..<dataPoints.count {
            let dataEntry = BubbleChartDataEntry(x: Double(i), y: unitsSold2[i], size: CGFloat(values[i]))
            dataEntries2.append(dataEntry)
        }
        
        let bubbleDataSet = BubbleChartDataSet(values: dataEntries, label: "Units Sold")
        bubbleDataSet.setColor(ChartColorTemplates.colorful()[0], alpha: 0.5)
        let bubbleDataSet2 = BubbleChartDataSet(values: dataEntries2, label: "Units Sold")
        bubbleDataSet2.setColor(ChartColorTemplates.colorful()[1], alpha: 0.5)
        let bubbleData = BubbleChartData(dataSets: [bubbleDataSet, bubbleDataSet2])
        
        bubbleChartView.data = bubbleData
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
