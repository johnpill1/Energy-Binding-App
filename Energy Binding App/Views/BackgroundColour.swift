//
//  BackgroundColour.swift
//  Energy Binding App
//
//  Created by John Pill on 01/04/2024.
//

import SwiftUI

struct BackgroundColour: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Params.metGreen, Params.metGreen, .white, .white, .white, .white]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundColour()
}
