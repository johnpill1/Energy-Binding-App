//
//  ContentView.swift
//  Energy Binding App
//
//  Created by John Pill on 30/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State var showSheet = false
    @State var totalEnergy = 0.0
    @State var sigma = 3.41e-10
    @State var epsilon = 1.65e-21
    @State var r = 6.82e-10
    @State var particles: [Particle] = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundColour()
                VStack {
                    VStack {
                        TotalEnergyView(totalEnergy: $totalEnergy)
                        SlidersView(sigma: $sigma, epsilon: $epsilon, r: $r)
                        
                        List {
                            ForEach(particles.reversed(), id: \.id) { particle in
                                ParticleListItem(particle: particle)
                            }
                            .onDelete(perform: delete)
                        }
                    }
                    .overlay(alignment: .bottomTrailing){
                        VStack {
                            HStack {
                                Button {
                                    showSheet = true
                                } label: {
                                    ButtonImageView(color: .red, image: "atom")
                                }
                                .padding(.bottom)
                            }
                            Button {
                                addParticle()
                            } label: {
                                ButtonImageView(color: Params.metGreen, image: "plus")
                            }
                        }
                    }
                    .sheet(isPresented: $showSheet) {
                        ZStack {
                            Color(Params.metGreen)
                                .edgesIgnoringSafeArea(.all)
                            
                            HStack {
                                ForEach(Array(Params.elementValues), id: \.id) { element in
                                    Image(element.name)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 75, height: 75)
                                        .cornerRadius(10)
                                        .shadow(color: .black, radius: 3)
                                        .padding()
                                        .onTapGesture {
                                            sigma = element.sigma
                                            epsilon = element.epsilon
                                    }
                                }
                            }
                        }
                        .presentationDetents([.height(150), .medium, .large])
                        .presentationDragIndicator(.automatic)
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
    }
    
    func calculateTotalEnergy() -> Double {
        var energy = 0.0
        for particle in particles {
            print(particle)
            energy += particle.totalEnergy
        }
        return energy
    }
    
    func delete(at offsets: IndexSet) {
        var offsetValue: Int = 0
        let arraySize = particles.count - 1
        for offset in offsets {
            offsetValue = offset
                   }
        particles.remove(at: (arraySize - offsetValue))
        totalEnergy = calculateTotalEnergy()

    }
}

#Preview {
    ContentView()
}




// Element tile images: https://sciencenotes.org/periodic-table-element-cells/
