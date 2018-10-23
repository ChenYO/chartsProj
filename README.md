# chartsProj

### Demo How to use Charts in IOS

# Bar Chart Example

    override func viewDidLoad() {
        super.viewDidLoad()    
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]

        setChart(dataPoints: months, values: unitsSold)
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
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
    }

