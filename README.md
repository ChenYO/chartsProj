# chartsProj

Demo How to use Charts in IOS

# Bar Chart Example

  `func setChart(dataPoints: [String], values: [Double]) {
      barChartView.noDataText = "You need to provide data for the chart."
        
      // Set xAxis
      barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
      barChartView.xAxis.granularity = 1
        
      // Set Value
      var dataEntries: [BarChartDataEntry] = []
      for i in 0..<dataPoints.count {
          let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
          dataEntries.append(dataEntry)
      }
        
      // Set DataSet to show our data
      let chartDataSet = BarChartDataSet(values: dataEntries, label: "Units Sold")
      let chartData = BarChartData(dataSet: chartDataSet)
      barChartView.data = chartData
  }`

