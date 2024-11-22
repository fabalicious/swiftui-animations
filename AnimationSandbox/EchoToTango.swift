//
//  EchoTangoLogo.swift
//  AnimationSandbox
//
//  Created by Fabian Knecht on 22.11.2024.
//

import SwiftUI


struct EchoToTango: View {
    var body: some View {
        VStack{
            HStack{
                EchoOverlap()
                Rectangle()
                    .frame(width:120, height:120)
                    .opacity(0)
            }
            .padding(15)
                Tango()
            }
           .padding(15)
        }
}

struct EchoCircle: View {
    var body: some View {
                Circle()
                    .strokeBorder(ETColourScheme.lavender, lineWidth: 25)
                    .frame(width: 120, height: 120)
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
        HStack {
            EchoToTango()
        }

    }
}


