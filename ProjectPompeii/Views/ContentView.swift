//
//  ContentView.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 14/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var navigationBond = NavigationBond(destination: .home)
    
    var body: some View {
        
        switch navigationBond.getDestination() {
                
            case .home:
                HomeView(navigationBond: $navigationBond)
                    .transition(.opacity)
                
            case .canvas:
                DrawingView(navigationBond: $navigationBond)
                    .transition(.opacity)
                
            case .cleo:
                CleoView(navigationBond: $navigationBond)
                    .transition(.opacity)
                
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let previewScreen = NavigationBond(destination: .canvas)
        
        ContentView(navigationBond: previewScreen)
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12")
        ContentView(navigationBond: previewScreen)
            .preferredColorScheme(.light)
            .previewDevice("iPhone 12")
        ContentView(navigationBond: previewScreen)
            .previewDevice("iPhone 13 Pro Max")
            .preferredColorScheme(.dark)
        ContentView(navigationBond: previewScreen)
            .previewDevice("iPhone 13 Pro Max")
            .preferredColorScheme(.light)
        ContentView(navigationBond: previewScreen)
            .previewDevice("iPhone 11")
            .preferredColorScheme(.dark)
        ContentView(navigationBond: previewScreen)
            .previewDevice("iPhone 11")
            .preferredColorScheme(.light)
        
    }
}
