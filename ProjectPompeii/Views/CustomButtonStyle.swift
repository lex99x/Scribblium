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
            .background(Color(red: 1.0, green: 0.25, blue: 0.71))
            .clipShape(Capsule())
        
    }
    
}
