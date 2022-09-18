//
//  ContentView.swift
//  TrafficLichtSUI
//
//  Created by Александр Михалев on 10.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var lightIsOn = 1.0
    @State private var lightIsOff = 0.3
    @State private var buttonTitle = "START!"
    @State private var opacityRed = 0.3
    @State private var opacityYellow = 0.3
    @State private var opacityGreen = 0.3
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack (spacing: 20) {
                Circle()
                    .frame(width: 120, height: 120)
                    .overlay(Circle().stroke(.white, lineWidth: 4))
                    .foregroundColor(.red)
                    .opacity(opacityRed)
                Circle()
                    .frame(width: 120, height: 120)
                    .overlay(Circle().stroke(.white, lineWidth: 4))
                    .foregroundColor(.yellow)
                    .opacity(opacityYellow)
                Circle()
                    .frame(width: 120, height: 120)
                    .overlay(Circle().stroke(.white, lineWidth: 4))
                    .foregroundColor(.green)
                    .opacity(opacityGreen)
                
                Spacer()
                
                Button(action: { changeOpacity() }) {
                    Text(buttonTitle)
                        .frame(width: 140, height: 50)
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 4))
                        .background(Color.blue).cornerRadius(15)
                }
                .padding(.top, 25)
                .padding(.bottom, 45)
            }
        }
    }
    private func changeOpacity() {
        buttonTitle = "Next"
        if opacityRed < 1 && opacityYellow < 1 && opacityGreen < 1 {
            opacityRed = lightIsOn
        } else if opacityRed == 1.0 {
            opacityRed = lightIsOff
            opacityYellow = lightIsOn
        } else if opacityYellow == 1.0 {
            opacityYellow = lightIsOff
            opacityGreen = lightIsOn
        } else if opacityGreen == 1.0 {
            opacityGreen = lightIsOff
            opacityRed = lightIsOn
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
