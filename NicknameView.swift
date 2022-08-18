//
//  NicknameView.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 18/08/22.
//

import Foundation
import SwiftUI

struct NicknameView: View {
    
    @State private var nickname: String = ""
    
    var body: some View {
        
        ZStack{
            
            Color("DrawBackground").ignoresSafeArea()
            Image("padraoPortrait")
            
            VStack {

                Text("Enter your nickname to start drawing!")
                    .font(.custom("RubikMarkerHatch-Regular", size: 38))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("SecondaryColor-1"))
                    .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 10, x: 8, y: 7)
                
                ZStack {
                    
                    Image("postItNickname")
                    
                    VStack {
//
//                        TextField(
//                            "Nickname",
//                            text: $nickname
//                        )
//                        .onSubmit {
//                            print(nickname)
//                        }
//                        .textFieldStyle(.roundedBorder)

                        Button (action: {print(true)}) {
                            Text("ok, go")
                                .font(.custom("RubikMarkerHatch-Regular", size: 32))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color("SecondaryColor-1"))
                                .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 10, x: 8, y: 7)
                        }.buttonStyle(CustomButtonStyle())

                    }
                    
                }
                
            }
            
        }
        
    }
    
}

struct NicknameView_Previews: PreviewProvider {
    static var previews: some View {
        NicknameView().preferredColorScheme(.dark)
        NicknameView().preferredColorScheme(.light)
    }
}
