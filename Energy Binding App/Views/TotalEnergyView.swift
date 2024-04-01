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
            Text("\(totalEnergy, format: .number.notation(.scientific))")
                .font(.system(size: 36)).fontWeight(.heavy)
            Text("Total Energy").italic()
        }
        .padding(20)
        .padding(.top, 20)
    }
}


