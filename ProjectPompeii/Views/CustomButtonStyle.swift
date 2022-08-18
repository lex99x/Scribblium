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
            .padding()
            .background(Color("DrawBackground"))
            .border(Color("Contorno"), width: 4).cornerRadius(31)
            .overlay(
                RoundedRectangle(cornerRadius: 31)
                    .strokeBorder(Color("Contorno"), lineWidth: 4)
            )
        
    }
    
}
