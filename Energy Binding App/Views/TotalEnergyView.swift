//
//  TotalEnergyView.swift
//  Energy Binding App
//
//  Created by John Pill on 30/03/2024.
//

import SwiftUI


struct TotalEnergyView: View {
    @Binding var totalEnergy: Double

    var body: some View {
        VStack {
            Text("\(totalEnergy, specifier: "%.1f")")
                .font(.system(size: 60)).fontWeight(.heavy)
            Text("Total Energy e-22 J")
        }
        .padding(20)
        .padding(.top, 20)
    }
}


