//
//  ColorDisplayScreenView.swift
//  ColorizedApp
//
//  Created by Илья on 17.10.2023.
//

import SwiftUI

struct ColorDisplayScreenView: View {
    let redTint: Double
    let greenTint: Double
    let blueTint: Double
    
    var body: some View {
        Rectangle()
            .frame(height: 170)
            .cornerRadius(20)
            .foregroundColor(
                Color(
                    red: redTint / 255,
                    green: greenTint / 255,
                    blue: blueTint / 255
                )
            )
            .shadow(color: .black, radius: 6, x: 0.0, y: 0.0)
    }
}

#Preview {
    ColorDisplayScreenView(redTint: 255, greenTint: 255, blueTint: 255)
}
