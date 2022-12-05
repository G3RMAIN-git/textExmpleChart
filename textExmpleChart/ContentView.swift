//
//  ContentView.swift
//  textExmpleChart
//
//  Created by Germain Buchet on 05/12/2022.
//

import SwiftUI
import SwiftPieChart


struct ContentView: View {
    var valuesPie : [Double] = [300,400,600,500]
    var namePie : [String] = ["Carburant","Energie","Comissions","Frais dommestique"]
    var colorChart: [Color] = [Color.fromInts(r: 0, g: 181, b: 216), Color.fromInts(r: 0, g: 119, b: 182),Color.fromInts(r: 144, g: 224, b: 238),Color.fromInts(r: 3, g: 4, b: 94)]
    
    
    let imageArray = ["car.fill","bolt.fill","house.fill","cart.fill"]
    //let imageView = UIImageView(image: image)
    
    var body: some View {
        VStack {
            PieChartView(values: valuesPie, names: namePie, formatter: { $0.description }, colors: colorChart, iconNames: imageArray, backgroundColor: Color.fromInts(r: 250, g: 250, b: 250))
            
            /*
            PieChartRows(colors: self.colorChart, names: self.namePie, values: self.valuesPie.map { $0.description }, percents: self.valuesPie.map { String(format: "%.0f%%", $0 * 100 / self.valuesPie.reduce(0, +)) })
             */
             
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
