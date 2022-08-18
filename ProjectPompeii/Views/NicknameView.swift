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
        
        VStack {
            
            Text("enter a nickname to draw!")
            
            VStack {
                
                TextField(
                    "Nickname",
                    text: $nickname
                )
                .onSubmit {
                    print(nickname)
                }
                .textFieldStyle(.roundedBorder)
                
                Button("start", action: {
                    
                    print(nickname)
                    
                }).buttonStyle(.bordered)
                
            }.padding()
            
        }
    
    }
    
}

struct NicknameView_Previews: PreviewProvider {
    static var previews: some View {
//        NicknameView()
        NicknameView().preferredColorScheme(.dark)
    }
}
