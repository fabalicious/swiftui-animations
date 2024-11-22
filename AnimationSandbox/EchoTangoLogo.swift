//
//  EchoTangoLogo.swift
//  AnimationSandbox
//
//  Created by Fabian Knecht on 22.11.2024.
//

import SwiftUI


struct EchoTangoLogo: View {
    var color: Color = .accentColor // Default color
    let lavender = Color(red: 198/255, green: 150/255, blue: 255/255)
    @State private var heartPulse: CGFloat = 2
    @State private var lavenderPulse: CGFloat = 2
    @State private var limePulse: CGFloat = 3

    var body: some View {
        VStack{
        ZStack{
            Circle()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                .foregroundColor(ETColourScheme.lime)
                .opacity(1)
                .scaleEffect(x: 2.0, y: 1.0, anchor: .center)
                .onAppear{
                    withAnimation(.easeInOut.repeatForever(autoreverses: true).speed(0.5)) {
                        limePulse = 0.25 * limePulse
                    }
                }
            Circle()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                .foregroundColor(.white)
                .scaleEffect(lavenderPulse)
                .onAppear{
                    withAnimation(.easeInOut.repeatForever(autoreverses: true).speed(0.5)) {
                        lavenderPulse = 0 * lavenderPulse
                    }
                }
        }
            ZStack{
                Circle()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .foregroundColor(ETColourScheme.lavender)
                    .scaleEffect(limePulse)
                    .onAppear{
                        withAnimation(.easeInOut.repeatForever(autoreverses: true).speed(0.5)) {
                            limePulse = 0.25 * limePulse
                        }
                    }
                Circle()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .foregroundColor(.white)
                    .scaleEffect(lavenderPulse)
                    .onAppear{
                        withAnimation(.easeInOut.repeatForever(autoreverses: true).speed(0.5)) {
                            lavenderPulse = 0 * lavenderPulse
                        }
                    }
            }
        }
        }
}

struct EchoTangoLogo_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            EchoTangoLogo()
        }

    }
}


