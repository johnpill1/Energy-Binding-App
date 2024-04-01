//
//  SlidersView.swift
//  Energy Binding App
//
//  Created by John Pill on 30/03/2024.
//

import SwiftUI

struct SlidersView: View {
    @Binding var sigma: Double
    @Binding var epsilon: Double
    @Binding var r: Double
    
    var body: some View {
        VStack {
            HStack {
                Text("σ")   .bold()
                Slider(value: $sigma, in: 0.1e-10...8.0e-10,  step: 0.01e-10)
                Text("\(sigma * pow(10, 10), specifier: "%.2f")").bold()
                Text("e-10").font(.subheadline)
            }
            .padding(.bottom)
            
            HStack {
                Text("ε")   .bold()
                Slider(value: $epsilon, in: 0.01e-21...8.0e-21, step: 0.01e-21)
                Text("\(epsilon * pow(10, 21), specifier: "%.2f")")   .bold()
                Text("e-21").font(.subheadline)

            }
            .padding(.bottom)
            
            HStack {
                Text("r")   .bold()
                Slider(value: $r, in: 2.0e-10...7.0e-10, step: 0.01e-10)
                Text("\(r * pow(10, 10), specifier: "%.2f")")   .bold()
                Text("e-10").font(.subheadline)

            }
            .padding(.bottom)
        }
        .padding()
     
    }
}

