//
//  MultipleBarChartViewController.swift
//  chartsProj
//
//  Created by 陳仲堯 on 2018/10/25.
//  Copyright © 2018年 陳仲堯. All rights reserved.
//

import UIKit
import Charts

class MultipleBarChartViewController: UIViewController {

    @IBOutlet weak var multipleBarChartView: BarChartView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setDataCount(Int(arc4random_uniform(30)), range: UInt32(arc4random_uniform(30)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setDataCount(_ count: Int, range: UInt32) {
        let groupSpace = 0.08
        let barSpace = 0.03
        let barWidth = 0.2
        // (0.2 + 0.03) * 4 + 0.08 = 1.00 -> interval per "group"
        let randomMultiplier = range * 100000
        let groupCount = count + 1
        let startYear = 1980
        let endYear = startYear + groupCount
        
        let block: (Int) -> BarChartDataEntry = { (i) -> BarChartDataEntry in
            return BarChartDataEntry(x: Double(i), y: Double(arc4random_uniform(randomMultiplier)))
        }
        let yVals1 = (startYear ..< endYear).map(block)
        let yVals2 = (startYear ..< endYear).map(block)
        let yVals3 = (startYear ..< endYear).map(block)
        let yVals4 = (startYear ..< endYear).map(block)
        
        let set1 = BarChartDataSet(values: yVals1, label: "Company A")
        set1.setColor(UIColor(red: 104/255, green: 241/255, blue: 175/255, alpha: 1))
        
        let set2 = BarChartDataSet(values: yVals2, label: "Company B")
        set2.setColor(UIColor(red: 164/255, green: 228/255, blue: 251/255, alpha: 1))
        
        let set3 = BarChartDataSet(values: yVals3, label: "Company C")
        set3.setColor(UIColor(red: 242/255, green: 247/255, blue: 158/255, alpha: 1))
        
        let set4 = BarChartDataSet(values: yVals4, label: "Company D")
        set4.setColor(UIColor(red: 255/255, green: 102/255, blue: 0/255, alpha: 1))
        
        let data = BarChartData(dataSets: [set1, set2, set3, set4])
        data.setValueFont(.systemFont(ofSize: 10, weight: .light))
//        data.setValueFormatter(LargeValueFormatter())
        
        // specify the width each bar should have
        data.barWidth = barWidth
        
        // restrict the x-axis range
        multipleBarChartView.xAxis.axisMinimum = Double(startYear)
        
        // groupWidthWithGroupSpace(...) is a helper that calculates the width each group needs based on the provided parameters
        multipleBarChartView.xAxis.axisMaximum = Double(startYear) + data.groupWidth(groupSpace: groupSpace, barSpace: barSpace) * Double(groupCount)
        
        data.groupBars(fromX: Double(startYear), groupSpace: groupSpace, barSpace: barSpace)
        
        multipleBarChartView.data = data
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
