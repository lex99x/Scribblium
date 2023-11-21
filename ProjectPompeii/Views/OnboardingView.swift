//
//  OnboardingView.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 13/06/23.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack {
            VStack{
                Image("Onboarding1")
                    .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 10, x: 8, y: 7)
                Text("Bem-vindo ao Scribblium!")
                    .font(.custom("Rubik-Bold", size: 20))
                    .frame(maxWidth: 256, maxHeight: 30)
                    .foregroundColor(.secondaryColor1)
                    .minimumScaleFactor(0.1)
                Text("Um jogo de desenho rápido e divertido.  Aqui só temos uma regra... Desenhe o máximo de scribbliuns que conseguir em 30 segundos!")
                    .font(.custom("Rubik-Regular", size: 17))
                    .frame(maxWidth: 285, maxHeight: 107)
                    .foregroundColor(.textPaperColor)
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.backgroundDrawViewColor
                .ignoresSafeArea()
            Image("padraoPortrait")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.5)
        }
        .statusBarHidden()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
