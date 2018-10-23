//
//  ScatterChartViewController.swift
//  chartsProj
//
//  Created by 陳仲堯 on 2018/10/23.
//  Copyright © 2018年 陳仲堯. All rights reserved.
//

import UIKit
import Charts

class ScatterChartViewController: UIViewController {

    @IBOutlet weak var scatterChartView: ScatterChartView!
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
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let scatterDataSet = ScatterChartDataSet(values: dataEntries, label: "Units Sold")
        scatterDataSet.setScatterShape(.circle)
        scatterDataSet.scatterShapeHoleColor = ChartColorTemplates.colorful()[3]
        scatterDataSet.scatterShapeHoleRadius = 3.5
        scatterDataSet.setColor(ChartColorTemplates.colorful()[1])
        scatterDataSet.scatterShapeSize = 12
        
        let scatterData = ScatterChartData(dataSets: [scatterDataSet])
        scatterData.setValueFont(.systemFont(ofSize: 14, weight: .light))
       
        scatterChartView.data = scatterData
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
