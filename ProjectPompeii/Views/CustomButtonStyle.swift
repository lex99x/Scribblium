//
//  CustomButton.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 18/08/22.
//

import Foundation
import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .padding(14)
            .background(Color("DrawBackground"))
            .border(Color("Contorno"), width: 4)
            .cornerRadius(31)
            .overlay(
                RoundedRectangle(cornerRadius: 31)
                    .strokeBorder(Color("Contorno"), lineWidth: 4)
            )
            .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: 0, y: 5)
            .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: 0, y: 5)
            .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: 0, y: 5)
        
    }
    
}
