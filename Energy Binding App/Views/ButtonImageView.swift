//
//  ButtonImageView.swift
//  Energy Binding App
//
//  Created by John Pill on 30/03/2024.
//

import SwiftUI


struct ButtonImageView: View {
    let metGreen: Color
    
    var body: some View {
        HStack {
            Image(systemName: "atom")
                .font(.system(size: 35))
        }
        .padding(10)
        .background(metGreen)
        .foregroundColor(.white)
        .cornerRadius(100)
        .padding(.trailing, 20)
        .padding(.bottom, -10)
    }
}


