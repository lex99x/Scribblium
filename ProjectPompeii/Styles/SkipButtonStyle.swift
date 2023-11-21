//
//  SkipButtonStyle.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 07/06/23.
//

import SwiftUI

struct SkipButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        ZStack(alignment: .center) {
            Circle()
                .frame(maxWidth: 62, maxHeight: 62)
//                .scaledToFill()
                .foregroundColor(.secondaryColor1)
                .overlay(
                    Circle()
                        .strokeBorder(Color.contornoColor, lineWidth: 3))
            Image(systemName: "forward.end.fill")
                .resizable()
                .frame(maxWidth: 22, maxHeight: 18.84)
                .foregroundColor(.tertiaryColor1)
//                .scaledToFill()
        }
    }
}

struct SkipButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {}) {}
            .buttonStyle(SkipButtonStyle())
    }
}
