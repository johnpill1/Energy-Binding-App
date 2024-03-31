//
//  ContentView.swift
//  Energy Binding App
//
//  Created by John Pill on 30/03/2024.
//

import SwiftUI

// TODO: Check that I don't need to convert the simple decimal values down - I think it definitlay has an effect!

// TODO: STILL NOT MATCHING OUTPUT - FIND AN ONLINE CALCULATOR.


struct ContentView: View {
    @State var totalEnergy = 0.0
    @State var upscaledTotalEnergy = 0.0
    @State var sigma = 3.41e-10
    @State var epsilon = 1.65e-21
    @State var r = 6.82e-10
    @State var particles: [Particle] = []
    let metGreen = Color(red: 0.62, green: 0.83, blue: 0.18)
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [metGreen, metGreen, .white, .white, .white, .white]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        TotalEnergyView(totalEnergy: $upscaledTotalEnergy)
                        SlidersView(sigma: $sigma, epsilon: $epsilon, r: $r)
                        
                        List {
                            ForEach(particles.reversed(), id: \.id) { particle in
                                HStack {
                                    VStack{
                                        HStack {
                                            Text("u: ").italic().bold()
                                            Text("\(particle.totalEnergy  * pow(10, 22), specifier: "%.1f")").bold().font(.title2)
                                            Text("e-22").font(.subheadline)
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
                            .onDelete(perform: delete)
                        }
                    }
                    .overlay(alignment: .bottomTrailing){
                        Button {
                            addParticle()
                        } label: {
                            ButtonImageView(metGreen: metGreen)
                        }
                    }
                }
            }
        }
    }
    
    func addParticle() {
        let attraction = pow((sigma / r), 6)
        let repulsion = pow(attraction, 2)
        let energy = 4 * epsilon * (repulsion - attraction)
        print(energy)

        particles.append(Particle(sigma: sigma, epsilon: epsilon, r: r, totalEnergy: energy))
        
        totalEnergy = calculateTotalEnergy()
        upscaleTotalEnergy()
    }
    
    func calculateTotalEnergy() -> Double {
        var energy = 0.0
        for particle in particles {
            print(particle)
            energy += particle.totalEnergy
        }
        return energy
    }
    
    func upscaleTotalEnergy() {
        upscaledTotalEnergy = totalEnergy * pow(10, 22)
        print("Upscaled total energy: \(upscaledTotalEnergy)")
    }
    
    func delete(at offsets: IndexSet) {
        particles.remove(atOffsets: offsets)
        totalEnergy = calculateTotalEnergy()
    }
}

#Preview {
    ContentView()
}



