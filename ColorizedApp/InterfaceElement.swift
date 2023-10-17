//
//  InterfaceElement.swift
//  ColorizedApp
//
//  Created by Илья on 17.10.2023.
//

import SwiftUI

struct ColorValueView: View {
    let value: Double
    
    var body: some View {
        Text(String(format: "%.0f", value))
    }
}

struct SliderColorView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        Slider(value: $sliderValue, in: 0...255, step: 1)
    }
}

struct ChangeableColorValueView: View {
    @Binding var changeableValue: Double

    var body: some View {
        TextField("", text: Binding(
                get: {
                    String(format: "%.0f", self.changeableValue)
                },
                set: {
                    self.changeableValue = Double($0) ?? 0
                }
            )
        )
    }
}
