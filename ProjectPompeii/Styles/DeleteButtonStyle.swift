//
//  DeleteButtonStyle.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 07/06/23.
//

import SwiftUI

struct DeleteButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        ZStack {
            Circle()
                .frame(maxWidth: 62, maxHeight: 62)
//                .scaledToFill()
                .foregroundColor(.secondaryColor1)
                .overlay(
                    Circle()
                        .strokeBorder(Color.contornoColor, lineWidth: 3))
            Image(systemName: "trash.fill")
                .resizable()
                .frame(maxWidth: 22, maxHeight: 24)
                .foregroundColor(.tertiaryColor1)
//                .scaledToFill()
        }
    }
}

struct DeleteButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {}) {}
            .buttonStyle(DeleteButtonStyle())
    }
}
