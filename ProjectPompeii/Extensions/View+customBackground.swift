//
//  View+customBackground.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 07/06/23.
//

import SwiftUI

struct CustomBackgroundModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color.backgroundDrawViewColor
                    .ignoresSafeArea()
                Image.backgroundImage
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .opacity(0.5)
            }
    }
    
}

extension View {
    
    func customBackground() -> some View {
        return modifier(CustomBackgroundModifier())
    }
    
}
