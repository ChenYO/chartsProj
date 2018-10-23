//
//  dataSet.swift
//  chartsProj
//
//  Created by 陳仲堯 on 2018/10/23.
//  Copyright © 2018年 陳仲堯. All rights reserved.
//

import Foundation

class DataSet {
    var months: [String]
    var data: [Double]
    
    init() {
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        data = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
    }
}
