//
//  CreditsView.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 14/09/22.
//

import SwiftUI

struct CreditsView: View {
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        
        ScrollView {
            
            Text("Credits")
            
            Text("App Developers")
                .multilineTextAlignment(.center)
                .font(.custom("Rubik-Regular", size: 13))
            Text("UI/UX Designer")
            Text("Quick Draw dataset")
            Text("Rubik Marker Hatch Font")
            Text("Rubik Font")
            Text("Sounds")
            
        }
        
//        Button("Press to dismiss") {
//            dismiss()
//        }
//        .font(.title)
//        .padding()
//        .background(.black)
        
    }
    
}

struct MainView: View {
    
    @State private var showSheet = false

    var body: some View {
        Button("Show Sheet") {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            CreditsView()
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
