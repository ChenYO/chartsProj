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
### Same as bar chart's function, just replace chart some codes

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

# Bubble Chart Example
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

# Scatter Chart Example
    
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

# Radar Chart Example

    let mult: UInt32 = 80
    let min: UInt32 = 20
    let cnt = 5
        
    let block: (Int) -> RadarChartDataEntry = { _ in return RadarChartDataEntry(value: Double(arc4random_uniform(mult) + min))}
    let entries1 = (0..<cnt).map(block)
    let entries2 = (0..<cnt).map(block)
        
    let set1 = RadarChartDataSet(values: entries1, label: "Last Week")
    set1.setColor(UIColor(red: 103/255, green: 110/255, blue: 129/255, alpha: 1))
    set1.fillColor = UIColor(red: 103/255, green: 110/255, blue: 129/255, alpha: 1)
    set1.drawFilledEnabled = true
    set1.fillAlpha = 0.7
    set1.lineWidth = 2
    set1.drawHighlightCircleEnabled = true
    set1.setDrawHighlightIndicators(false)
      
    let set2 = RadarChartDataSet(values: entries2, label: "This Week")
    set2.setColor(UIColor(red: 121/255, green: 162/255, blue: 175/255, alpha: 1))
    set2.fillColor = UIColor(red: 121/255, green: 162/255, blue: 175/255, alpha: 1)
    set2.drawFilledEnabled = true
    set2.fillAlpha = 0.7
    set2.lineWidth = 2
    set2.drawHighlightCircleEnabled = true
    set2.setDrawHighlightIndicators(false)
        
    let data = RadarChartData(dataSets: [set1, set2])
    data.setValueFont(.systemFont(ofSize: 8, weight: .light))
    data.setDrawValues(false)
    data.setValueTextColor(.white)
      
    radarChartView.data = data
