//
//  Params.swift
//  Energy Binding App
//
//  Created by John Pill on 01/04/2024.
//

import SwiftUI



enum Params {
    static let metGreen = Color(red: 0.62, green: 0.83, blue: 0.18)
    static let metRed = Color(red: 0.9, green: 0.2, blue: 0.1)
    static let elementValues = [
        ElementValues(name: "Helium", sigma: 2.65e-10, epsilon: 9.13240642e-23),
        ElementValues(name: "Neon", sigma: 2.76e-10, epsilon: 5.04685618e-22),
        ElementValues(name: "Argon", sigma: 3.44e-10, epsilon: 1.6822854e-21)
    ]
}
