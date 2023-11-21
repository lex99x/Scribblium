//
//  BackButtonStyle.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 05/06/23.
//

import SwiftUI

struct BackButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        Image(systemName: "chevron.left")
            .resizable()
            .frame(maxWidth: 18, maxHeight: 24)
            .foregroundColor(Color.secondaryColor1)
    }
}

struct BackButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {}) {}
            .buttonStyle(BackButtonStyle())
            .preferredColorScheme(.dark)
    }
}
