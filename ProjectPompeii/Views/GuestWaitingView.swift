//
//  GuestWaitingView.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 02/09/22.
//

import SwiftUI

struct GuestWaitingView: View {
    
    var body: some View {
        
        VStack {
            
            VStack {
                
                VStack {
                    Button(action: {
                        print("Disconnecting from host game...")
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: 60, height: 60)
                                .foregroundColor(
                                    Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00))
                                )
                                .overlay(
                                    Circle().strokeBorder(Color("Contorno"), lineWidth: 3)
                                )
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color("TertiaryColor-1"))
                                .font(Font.system(size: 60, weight: .bold))
                        }
                    }
                    Text("Leave")
                        .font(.custom("RubikMarkerHatch-Regular", size: 14))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 25)
    
                Image("friendos lightmode")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, 50)

                Text("Waiting for the host to start the game...")
                    .font(.custom("RubikMarkerHatch-Regular", size: 32))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("SecondaryColor-1"))
                    .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: 0, y: 5)
                    .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: 0, y: 5)
                    .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: 0, y: 5)
            }
            .padding([.horizontal])
            
        }.frame(
            width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height
        ).background {
            Color("DrawBackground")
                .ignoresSafeArea()
            Image("padraoPortrait")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
        }
        
    }
}

struct GuestWaitingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GuestWaitingView().previewDevice("iPhone 12").preferredColorScheme(.light).previewInterfaceOrientation(.portrait)
            GuestWaitingView().previewDevice("iPhone 13 Pro Max").preferredColorScheme(.light).previewInterfaceOrientation(.portrait)
        }
    }
}
