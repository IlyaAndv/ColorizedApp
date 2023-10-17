//
//  ContentView.swift
//  ColorizedApp
//
//  Created by Илья on 15.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var meaningOfRedColor = Double.random(in: 0...255)
    @State private var meaningOfGreenColor = Double.random(in: 0...255)
    @State private var meaningOfBlueColor = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color.brown
                .ignoresSafeArea()
            
            VStack(spacing: 23) {
                ColorDisplayScreenView(
                    redTint: meaningOfRedColor,
                    greenTint: meaningOfGreenColor,
                    blueTint: meaningOfBlueColor
                )
                
                VStack(spacing: 11) {
                    InterfaceElementView(
                        colorValue: $meaningOfRedColor,
                        specifiedColor: .red
                    )
                    
                    InterfaceElementView(
                        colorValue: $meaningOfGreenColor,
                        specifiedColor: .green
                    )
                    
                    InterfaceElementView(
                        colorValue: $meaningOfBlueColor,
                        specifiedColor: .blue
                    )
                }
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("OK", action: closeToolbar)
                }
            }
            .padding()
        }
    }
    
    private func closeToolbar() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}

struct InterfaceElementView: View {
    @Binding var colorValue: Double
    
    let specifiedColor: Color
    
    var body: some View {
        HStack {
            ColorValueView(value: colorValue)
                .frame(width: 37)
                .foregroundStyle(.black)
                .shadow(color: specifiedColor, radius: 1, x: 1, y: 2)
                .font(.custom("Noteworthy", fixedSize: 16))
            
            SliderColorView(sliderValue: $colorValue)
                .accentColor(specifiedColor)
                .shadow(color: specifiedColor, radius: 5, x: 1, y: 2)
                .shadow(color: .black, radius: 5, x: 2, y: 3)
            
            ChangeableColorValueView(changeableValue: $colorValue)
                .frame(width: 37)
                .foregroundStyle(.black)
                .shadow(color: specifiedColor, radius: 1, x: 1, y: 2)
                .font(.custom("Noteworthy", fixedSize: 16))
                .keyboardType(.numberPad)
        }
    }
}

#Preview {
    ContentView()
}
