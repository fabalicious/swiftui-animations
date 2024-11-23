//
//  EchoTangoLogo.swift
//  AnimationSandbox
//
//  Created by Fabian Knecht on 22.11.2024.
//

import SwiftUI

struct TangoAnimate: View {
    @State private var w = 120.0
    var body: some View {
        EchoToTango()
    }
}


struct EchoToTango: View {
    var body: some View {
        VStack{
            HStack {
                EchoLeft()
//                EchoBar2()
//                    .padding(0)
//                EchoRight()
//                    .padding(0)
            }
            .frame(width: 360, height: 120, alignment: .leading)
            .padding(0)
        }
        .padding(0)
    }
}



struct EchoLeft: View {
    var body: some View {
        ZStack{
            Circle()
                .trim(from: 0.25, to: 0.75)
                .frame(width: 120, height: 120)
                .foregroundColor(ETColourScheme.lime)
                .padding(0)
                .offset(x: 60, y: 0)
//            Circle()
//                .trim(from: 0.25, to: 0.75)
//                .foregroundColor(.white)
//                .padding(0)
//                .frame(width: 35, height: 70)
//                .offset(x: 0, y: 0)
        }
        .frame(width: 60, height: 120, alignment: .leading)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        .padding(0)
       }
}

struct EchoBar2: View {
    let color = ETColourScheme.lavender
    @State var w = 0.0
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .frame(width: w, height: 25)
                .foregroundColor(color)
                .padding(0)
            Rectangle()
                .frame(width: w, height: 70)
                .foregroundColor(.gray)
                .padding(0)
                .onAppear() {
                    withAnimation(.easeInOut.repeatForever(autoreverses: true).speed(0.5)) {
                        w = 120
                    }
                }
            Rectangle()
                .frame(width: w, height: 25)
                .foregroundColor(color)
                .padding(0)
        }
        .frame(width: w, height: 120, alignment: .leading)
        .padding(0)
    }
}


struct EchoColor2: View {
    @State private var offsetY: CGFloat = 0 // Vertical offset
    @State private var circleColor: Color = ETColourScheme.lime
    @State private var rect1Height = 120.0
    @State private var rect2Height = 120.0
    @State private var h1 = 120.0
    @State private var h2 = 120.0
    @State private var w1 = 120.0
    @State private var w2 = 120.0
    @State private var rc = 0.0

    var body: some View {
        ZStack(alignment: .center) {
//            VStack {
//                Rectangle()
//                    .frame(width: 120, height: rect1Height)
//                    .foregroundColor(.red)
//                Spacer()
//            }
//            .frame(height: 120)
//            .padding(0)
            Rectangle()
                .frame(width: 120, height: 120)
                .padding(0)
                .foregroundColor(ETColourScheme.lime)
            // Colour shift in from the right
            HStack {
                Rectangle()
                    .frame(width: w1, height: 120)
                    .padding(0)
                    .foregroundColor(circleColor)
            }
            .frame(width: 120, height: 120, alignment: .leading)
            .padding(0)
            // Colour shift in from the left
            HStack {
//                Spacer()
                Rectangle()
                    .frame(width: w2, height: 120)
                    .padding(0)
                    .foregroundColor(.black)
            }
            .frame(width: 120, height: 120, alignment: .trailing)
            .padding(0)
            // Colour shift in from below
            VStack {
//                Spacer()
                Rectangle()
                    .frame(width: 120, height: h1)
                    .padding(0)
                    .foregroundColor(ETColourScheme.lime)
            }
            .frame(width: 120, height: 120, alignment: .bottom)
            .padding(0)
            // Colour shift in from above
            VStack {
                Rectangle()
                    .frame(width: 120, height: h2)
                    .padding(0)
                    .foregroundColor(ETColourScheme.lavender)
//                Spacer()
            }
            .frame(width: 120, height: 120, alignment: .top)
            .padding(0)
            Circle()
                .frame(width: rc, height: rc) // Diameter = 2 * radius
                .foregroundColor(.white)
        }
        .frame(width: 120, height: 120)
        .padding(0)
        .onTapGesture {
            animationSequence()
        }
        .mask( // Apply the mask here
            EchoDot()
        )
//        .clipped() // Ensures the content doesn't overflow
    }
    
    private func animationSequence() {
        let dur: TimeInterval = 0.5
        let durStep1: TimeInterval = dur
        let durStep2: TimeInterval = dur
        let durStep3: TimeInterval = dur
        let durStep4: TimeInterval = dur
        let durStep5: TimeInterval = dur

        withAnimation(.easeInOut(duration: durStep1)) { // Animate the vertical movement
            h2 = h2 == 120 ? 0 : 120
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + durStep1) {
            withAnimation(.easeInOut(duration: durStep2)) {
                h1 = h1 == 120 ? 0 : 120
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + durStep1 + durStep2) {
            withAnimation(.easeInOut(duration: durStep3)) {
                w2 = w2 == 120 ? 0 : 120
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + durStep1 + durStep2 + durStep3) {
            withAnimation(.easeInOut(duration: durStep4)) {
                w1 = w1 == 120 ? 0 : 120
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + durStep1 + durStep2 + durStep3 + durStep4) {
            withAnimation(.easeInOut(duration: durStep5)) {
                rc = rc == 0 ? 70 : 0
            }
        }
    }
}

struct EchoDot: View {
    var body: some View {
        Circle()
            .frame(width: 120, height: 120) // Circle defining the mask area
    }
}

struct EchoColor3: View {
    @State private var offsetY: CGFloat = -120 // Vertical offset
    @State private var circleColor = ETColourScheme.lime
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 120, height: 120)
                .foregroundColor(ETColourScheme.lavender)
                .mask( // Apply the mask here
                    Circle()
                        .frame(width: 120, height: 120) // Circle defining the mask area
                )
            Rectangle()
                .frame(width: 120, height: 120)
                .offset(y: offsetY)
                .foregroundColor(circleColor)
                .frame(width: 120, height: 120) // Frame for the ZStack
                .mask( // Apply the mask here
                    Circle()
                        .frame(width: 120, height: 120) // Circle defining the mask area
                )
                .onTapGesture {
                    animationSequence()
                }
        }
        .clipped() // Ensures the content doesn't overflow
    }
    
    private func animationSequence() {
        withAnimation(.easeInOut(duration: 1)) { // Animate the vertical movement
            offsetY = offsetY == -120 ? 0 : -120 // Toggle position
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(.easeInOut(duration: 0)) {
                circleColor = ETColourScheme.lime
            }
        }
    }
}

struct EchoColor: View {
    @State private var offsetY: CGFloat = 0 // Vertical offset
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 120, height: 120)
                .foregroundColor(ETColourScheme.lavender)
                .mask( // Apply the mask here
                    Circle()
                        .frame(width: 120, height: 120) // Circle defining the mask area
                )
            Rectangle()
                .frame(width: 120, height: 120)
                .offset(y: offsetY)
                .foregroundColor(ETColourScheme.lime)
                .frame(width: 120, height: 120) // Frame for the ZStack
                .mask( // Apply the mask here
                    Circle()
                        .frame(width: 120, height: 120) // Circle defining the mask area
                )
                .onAppear() {
                    withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) { // Animate the vertical movement
                        offsetY = offsetY == 0 ? 200 : 0 // Toggle position
                    }
                }
        }
        .clipped() // Ensures the content doesn't overflow
    }
}

struct EchoBar: View {
    let color = ETColourScheme.lime
    @State var w = 0.0
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .frame(width: w, height: 25)
                .foregroundColor(color)
                .padding(0)
            Rectangle()
                .frame(width: w, height: 70)
                .foregroundColor(.white)
                .padding(0)
                .onAppear() {
                    withAnimation(.easeInOut.repeatForever(autoreverses: true).speed(0.5)) {
                        w = 120
                    }
                }
            Rectangle()
                .frame(width: w, height: 25)
                .foregroundColor(color)
                .padding(0)
        }
        .frame(width: w, height: 120, alignment: .leading)
        .padding(0)
    }
}

struct EchoRight: View {
    var body: some View {
        ZStack{
                Circle()
                    .trim(from: 0.25, to: 0.75)
                    .rotationEffect(.degrees(-180))
                    .foregroundColor(ETColourScheme.lime)
                    .frame(width: 120, height: 120)
                    .offset(x: -65, y: 0)
            Circle()
                .trim(from: 0.25, to: 0.75)
                .rotationEffect(.degrees(-180))
                .foregroundColor(.white)
                .frame(width: 70, height: 70)
                .offset(x: -65, y: 0)
        }
    }
}

struct EchoCircle: View {
    var body: some View {
                Circle()
                    .strokeBorder(ETColourScheme.lavender, lineWidth: 25)
                    .frame(width: 120, height: 120)
        }
}


struct EchoZoom: View {
   @State private var isScaled = false

    var body: some View {
        ZStack{
        RoundedRectangle(cornerRadius: 60)
            .foregroundColor(ETColourScheme.lime)
            .frame(width: 120, height: 120)
        RoundedRectangle(cornerRadius: 35)
            .foregroundColor(.white)
            .frame(width: 70, height: 70)
    }
                .scaleEffect(isScaled ? 2.0 : 1.0) // Scale up or down based on state
                .animation(.easeInOut, value: isScaled) // Implicit animation
                .onTapGesture {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // Delay by 0.5 seconds
                        isScaled.toggle()
                    }
                }
        }
    }


struct EchoOverlap: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 60)
                .foregroundColor(ETColourScheme.lime)
                .frame(width: 120, height: 120)
            RoundedRectangle(cornerRadius: 35)
                .foregroundColor(.white)
                .frame(width: 70, height: 70)
        }
    }
}

struct Echo: View {
    var body: some View {
                RoundedRectangle(cornerRadius: 60)
                    .strokeBorder(ETColourScheme.lime, lineWidth: 30)
                    .frame(width: 120, height: 120)
        }
}

struct Tango: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 60)
            .strokeBorder(ETColourScheme.lavender, lineWidth: 25)
            .frame(width: 240, height: 120)
        }
}

struct EchoToTango_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            //EchoBar()
            //EchoToTango()
            HStack {
                EchoColor2()
                Spacer()
            }
            .frame(width: 240)
            .padding(20)
            TangoAnimate()
        }

    }
}


