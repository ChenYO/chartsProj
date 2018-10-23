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

# Line Chart Example

    let lineChartDataSet = LineChartDataSet(values: dataEntries, label: "Units Sold")
    let lineChartData = LineChartData(dataSet: lineChartDataSet)    
    lineChartView.data = lineChartData

# Pie Chart Example

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
