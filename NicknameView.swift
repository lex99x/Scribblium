//
//  NicknameView.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 18/08/22.
//

import Foundation
import SwiftUI

struct AppContentView: View {
    
    @State var isNicknameReady = false
    
    var body: some View {
        
        return Group {
        
            if isNicknameReady {
                ContentView()
            } else {
                NicknameView(isNicknameReady: $isNicknameReady)
            }
        }
    }
    
}

struct NicknameView: View {
    
    @State private var nickname = ""
    @Binding var isNicknameReady: Bool
//    @State private var $linkSelection: String? = nil
    
    var body: some View {
        
        ZStack {
            
            Color("DrawBackground")
                .ignoresSafeArea()
            Image("padraoPortrait")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                
                Text("Enter your nickname to start drawing!")
                    .font(.custom("RubikMarkerHatch-Regular", size: 38))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("SecondaryColor-1"))
                    .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: 0, y: 5)
                    .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: 0, y: 5)
                    .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: 0, y: 5)
                
                ZStack(alignment: .bottom) {
                    
                    VStack(alignment: .center) {
                        
                        TextField("", text: $nickname)
                            .padding()
                            .placeholder(when: nickname.isEmpty) {
                                Text("nickname")
                                    .font(.custom("RubikMarkerHatch-Regular", size: 18))
                                    .foregroundColor(.gray)
                            }
                            .font(.custom("RubikMarkerHatch-Regular", size: 18))
                            .foregroundColor(.gray)
                            .background(.white)
                            .border(Color("TertiaryColor-1"), width: 3)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .strokeBorder(Color("TertiaryColor-1"), lineWidth: 3)
                            )
                        
                    }
                    .padding([.horizontal], 10)
                    .frame(width: 342, height: 211)
                    .background(
                        Image("postItNickname")
                    )
                    
                    Button(action: {
                        
                        if !(nickname.isEmpty) {
                            self.isNicknameReady = true
                            UserDefaults.standard.set(nickname, forKey: "playerNickname")
                        } else {
                            print("Nickname vazio!")
                        }
                        
                    }) {
                        Text("ok, go!")
                            .font(.custom("RubikMarkerHatch-Regular", size: 32))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("SecondaryColor-1"))
                    }
                    .buttonStyle(CustomButtonStyle())
                    
                }
                
            }
            .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: 0, y: 5)
            .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: 0, y: 5)
            .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: 0, y: 5)
            
        }
        
    }
    
//    private func saveNickname() {
//        UserDefaults.standard.set(nickname, forKey: "playerNickname")
//    }
    
}

extension View {
    
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .center,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}

//struct NicknameView_Previews: PreviewProvider {
//    static var previews: some View {
//        NicknameView(isNicknameReady: false).preferredColorScheme(.dark)
//        NicknameView(false).preferredColorScheme(.light)
//    }
//}
