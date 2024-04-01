//
//  ButtonImageView.swift
//  Energy Binding App
//
//  Created by John Pill on 30/03/2024.
//

import SwiftUI


struct ButtonImageView: View {
    let color: Color
    let image: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .font(.system(size: 35))
        }
        .frame(width: 65, height: 65)
        .background(color)
        .foregroundColor(.white)
        .clipShape(Circle())        
        .shadow(color: .black, radius: 3)
        .padding(.trailing, 20)
        .padding(.bottom, -10)
    }
}


