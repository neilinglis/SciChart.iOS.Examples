//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2019. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// PieChartView.swift is part of the SCICHART® Examples. Permission is hereby granted
// to modify, create derivative works, distribute and publish any part of this source
// code whether for commercial, private or personal use.
//
// The SCICHART® examples are distributed in the hope that they will be useful, but
// without any warranty. It is provided "AS IS" without warranty of any kind, either
// expressed or implied.
//******************************************************************************

class PieChartView: SinglePieChartWithLegendLayout {
    
    override func initExample() {
        let pieSeries = SCIPieRenderableSeries()
        pieSeries.segments.add(buildSegmentWithValue(segmentValue: 40, title: "Green", gradientBrush: SCIRadialGradientBrushStyle(centerColorCode: 0xff84BC3D, edgeColorCode: 0xff5B8829)))
        pieSeries.segments.add(buildSegmentWithValue(segmentValue: 10, title: "Red", gradientBrush: SCIRadialGradientBrushStyle(centerColorCode: 0xffe04a2f, edgeColorCode: 0xffB7161B)))
        pieSeries.segments.add(buildSegmentWithValue(segmentValue: 20, title: "Blue", gradientBrush: SCIRadialGradientBrushStyle(centerColorCode: 0xff4AB6C1, edgeColorCode: 0xff2182AD)))
        pieSeries.segments.add(buildSegmentWithValue(segmentValue: 15, title: "Yellow", gradientBrush: SCIRadialGradientBrushStyle(centerColorCode: 0xffFFFF00, edgeColorCode: 0xfffed325)))
        
        // hiding the donut Renderable series - needed for animation
        // by default the pie renderable series are visible, so that when the animation starts - the pie chart might be already drawn
        pieSeries.isVisible = false
        
        let selectionModifier = SCIPieSelectionModifier()
        selectionModifier.selectionMode = .singleSelectDeselectOnDoubleTap
        
        let legendModifier = SCIPieLegendModifier()
        legendModifier.sourceSeries = pieSeries;
        legendModifier.margins = UIEdgeInsets(top: 17, left: 17, bottom: 17, right: 17)
        legendModifier.position = [.bottom, .centerHorizontal];
        
        pieChartSurface.renderableSeries.add(pieSeries)
        pieChartSurface.chartModifiers.add(legendModifier)
        pieChartSurface.chartModifiers.add(selectionModifier)
        
        // adding animations for the donut renderable series
        DispatchQueue.main.async {
            pieSeries.animate(0.7)
            pieSeries.isVisible = true
        }
    }
    
    func buildSegmentWithValue(segmentValue: Double, title: String, gradientBrush: SCIRadialGradientBrushStyle) -> SCIPieSegment {
        let segment = SCIPieSegment()
        segment.fillStyle = gradientBrush
        segment.value = segmentValue
        segment.title = title
        
        return segment
    }
}
