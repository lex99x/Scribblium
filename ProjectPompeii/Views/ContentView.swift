//
//  MainView.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 14/09/22.
//

import SwiftUI
//import AVKit

struct ContentView: View {
    
    @State var navigationBond = NavigationBond(destination: .home)
    //    @State var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        
        switch navigationBond.getDestination() {
                
            case .home:
                HomeViewSolo(navigationBond: $navigationBond)
                    .transition(.opacity)
                
            case .canvas:
                DrawView(navigationBond: $navigationBond)
                    .transition(.opacity)
                
            case .cleo:
                CleoView(navigationBond: $navigationBond)
                    .transition(.opacity)
                
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let previewScreen = NavigationBond(destination: .home)
        
        ContentView(navigationBond: previewScreen)
            .preferredColorScheme(.dark)
        ContentView(navigationBond: previewScreen)
            .preferredColorScheme(.light)
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
