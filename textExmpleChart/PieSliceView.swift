//
//  PieSliceView.swift
//  
//
//  Created by Nazar Ilamanov on 4/23/21.
//

import SwiftUI

@available(OSX 10.15, *)
struct PieSlice: View {
    var pieSliceData: PieSliceData
    var angleSpace: Angle = Angle(degrees: 3)
    
    
    
    var midRadians: Double {
        return Double.pi / 2.0 - (pieSliceData.startAngle  + pieSliceData.endAngle).radians / 2.0
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Path { path in
                    let width: CGFloat = min(geometry.size.width, geometry.size.height)
                    let height = width
                    path.move(
                        to: CGPoint(
                            x: width * 0.5,
                            y: height * 0.5
                        )
                    )
                    
                    path.addArc(center: CGPoint(x: width * 0.5, y: height * 0.5)
                                , radius: width * 0.5
                                , startAngle: Angle(degrees: -90.0) + pieSliceData.startAngle + angleSpace
                                , endAngle: Angle(degrees: -90.0) + pieSliceData.endAngle - angleSpace
                                , clockwise: false)
                    
                    
                }
                .fill(pieSliceData.color)
                
                
                
                VStack{
                    Image(systemName: pieSliceData.iconName)
                        //.font(.)
                    Text(pieSliceData.text)
                        .foregroundColor(Color.white.opacity(0.75))
                    
                        
                    
                }
                .position (
                    x: geometry.size.width * 0.5 * CGFloat(1.0 + 0.78 * cos(self.midRadians)),
                    y: geometry.size.height * 0.5 * CGFloat(1.0 - 0.78 * sin(self.midRadians))
                )
                
            }
            .aspectRatio(1, contentMode: .fit)
        }
    }
}

@available(OSX 10.15, *)
struct PieSliceData {
    var startAngle: Angle
    var endAngle: Angle
    var text: String
    var color: Color
    var iconName: String
}

@available(OSX 10.15.0, *)
struct PieSlice_Previews: PreviewProvider {
    static var previews: some View {
        PieSlice(pieSliceData: PieSliceData(startAngle: Angle(degrees: 0.0), endAngle: Angle(degrees: 120.0), text: "30%", color: Color.black, iconName: "car"))
    }
}

extension Color{
    static func fromInts(r: Int, g: Int, b: Int) -> Color {
        Color.init(red: Double(r)/255, green: Double(g)/255, blue: Double(b)/255)
        
    }
}
