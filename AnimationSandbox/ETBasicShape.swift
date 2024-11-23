//
//  ETBasicShape.swift
//  AnimationSandbox
//
//  Created by Fabian Knecht on 24.11.2024.
//

import SwiftUI

struct HalfCircle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let center = CGPoint(x: rect.midX, y: 0) //rect.midY)
            let radius = rect.width / 2
            path.addArc(
                center: center,
                radius: radius,
                startAngle: .degrees(90),
                endAngle: .degrees(270),
                clockwise: true
            )
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY)) // Connect back to the center
            path.closeSubpath()
        }
    }
}

struct HalfCircleRotate: View {
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.5) // Keep half the circle
            .rotation(.degrees(90)) // Rotate to show the flat side at the bottom
            .fill(Color.red)
            .frame(width: 100, height: 100) // Height = 2 * Width
    }
}

struct HalfCircleClipped: View {
    var body: some View {
        Circle()
            .fill(Color.blue)
            .clipShape(HalfCircleShape())
            .frame(width: 100, height: 200) // Height = 2 * Width
    }
}

struct HalfCircleShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            let radius = rect.width / 2

            // Start at the middle-right
            path.addArc(
                center: center,
                radius: radius,
                startAngle: .degrees(0),
                endAngle: .degrees(180),
                clockwise: true
            )
            path.addLine(to: center) // Draw a line to the center
            path.closeSubpath()
        }
    }
}

//struct HalfCircleRoundRect: View {
//    var body: some View {
//        RoundedRectangle(cornerRadius: 50)
//            .fill(Color.green)
//            .frame(width: 100, height: 100) // Height = 2 * Width
////            .rotationEffect(Angle.degrees(90))
//    }
//}

struct HalfCircleMask: View {
    var color = ETColourScheme.lime
    var circleStart = 0.25
    var circleEnd = 0.75
    var rotation = Angle.degrees(0)
    var offset = 25.0
    var radius = 50.0
    var body: some View {
        Circle()
            .trim(from: circleStart, to: circleEnd) // Retain only half of the circle
            .rotation(rotation) // Rotate so the flat side is horizontal
            .fill(color)
            .offset(CGSize(width: offset, height: 0.0))
            .frame(width: 2 * radius, height: 2 * radius) // Height = 2 * Width
            .padding(0)
    }
}

struct HalfCircleOutline: View {
    var body: some View {
        let TangoLeft =
        ZStack {
            HalfCircleMask(radius: 60.0) // Outer circle
            HalfCircleMask(color: .white, radius: 35.0) // Center
        }
        TangoLeft
    }
}


struct ETBasicShape_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            HalfCircleOutline()
            HStack(spacing: 0) {
                //            HalfCircle()
                //                .fill(Color.blue)
                //                .frame(width: 100, height: 100) // Height = 2 * Width
                //                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                HalfCircleMask()
                    .frame(width: 50, height: 100) // Height = 2 * Width
                //                .padding(0)
                //                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                Rectangle ()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .foregroundColor(ETColourScheme.lime)
                HalfCircleMask(circleStart: 0.25, circleEnd: 0.75, rotation: .degrees(180), offset: -25.0)
                    .frame(width: 50, height: 100) // Height = 2 * Width
                //                .padding(0)
                //                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                //            HalfCircleClipped()
                //                .frame(width: 100, height: 50) // Height = 2 * Width
                //                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                //            HalfCircleRotate()
                //                .frame(width: 100, height: 100) // Height = 2 * Width
                //                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            }
            .padding(0)
        }
    }
}
