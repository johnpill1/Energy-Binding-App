//
//  ParticleListItem.swift
//  Energy Binding App
//
//  Created by John Pill on 01/04/2024.
//

import SwiftUI

struct ParticleListItem: View {
    @State var particle: Particle
    
    var body: some View {
        HStack {
            VStack{
                HStack {
                    Text("υ: ").bold()
                    Text("\(particle.totalEnergy, format: .number.notation(.scientific))").bold()
                }
            }
            
            Spacer()
            
            VStack{
                Text("σ: \(particle.sigma * pow(10, 10), specifier: "%.2f")e-10")
                Text("ε: \(particle.epsilon  * pow(10, 21), specifier: "%.2f")e-21")
                Text("r: \(particle.r  * pow(10, 10), specifier: "%.2f")e-10")
            }
            .font(.caption)
        }
    }
}


