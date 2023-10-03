//
//  PauseButtonStyle.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 05/06/23.
//

import SwiftUI

struct PauseButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        ZStack {
            Circle()
                .frame(maxWidth: 62, maxHeight: 62)
                .foregroundColor(.secondaryColor1)
                .overlay(
                    Circle()
                        .strokeBorder(Color.contorno, lineWidth: 3))
            
            Image(systemName: "pause.fill")
                .resizable()
                .frame(maxWidth: 19, maxHeight: 25)
                .foregroundColor(.tertiaryColor1)
        }
    }
}

struct PauseButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {}) {}
            .buttonStyle(PauseButtonStyle())
    }
}
