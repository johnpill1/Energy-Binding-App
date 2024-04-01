//
//  ParticleModel.swift
//  Energy Binding App
//
//  Created by John Pill on 30/03/2024.
//

import Foundation


struct Particle {
    let id = UUID()
    let sigma: Double
    let epsilon: Double
    let r: Double
    let totalEnergy: Double
}


struct ElementValues {
    let id = UUID()
    let name: String
    let sigma: Double
    let epsilon: Double
}

