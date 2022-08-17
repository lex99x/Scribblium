//
//  DrawView.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 17/08/22.
//

import SwiftUI

struct DrawView: View {
    
    var body: some View {
        ZStack {
            
            Color(UIColor(red: 0.71, green: 0.71, blue: 0.71, alpha: 1.00))
                .ignoresSafeArea()
            
            VStack {

                Canvas { context, size in
                    
                    
                }
                .frame(width: 338, height: 501)
                //padrão em todos os modos
                .background(Color(UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)))
                .border(Color(UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.00)))
                
                .padding()
            }
        }
        
    }
}

struct DrawView_Previews: PreviewProvider {
    static var previews: some View {
        DrawView()
    }
}
