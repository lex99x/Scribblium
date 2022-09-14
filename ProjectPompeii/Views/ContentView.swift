//
//  MainView.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 14/09/22.
//

import SwiftUI
//import AVKit

enum Screen {
    
    case home, canvas, cleo
    
}

struct ContentView: View {
    
    @State var screenToShow: Screen
//    @State var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        
        switch screenToShow {
            
        case .home:
            HomeViewSolo(screenToShow: $screenToShow)
                .transition(.opacity)
//                .onAppear() {
//                    let soundPath = Bundle.main.path(forResource: "fantasia", ofType: ".mp3")
//                    let soundUrl = URL(fileURLWithPath: soundPath!)
//                    audioPlayer = try! AVAudioPlayer(contentsOf: soundUrl)
//                    audioPlayer.numberOfLoops = 1
//                    audioPlayer.prepareToPlay()
//                    audioPlayer.play()
//                }
        case .canvas:
            DrawView(screenToShow: $screenToShow)
                .transition(.opacity)
        case .cleo:
            CleoView(screenToShow: $screenToShow)
                .transition(.opacity)
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let previewScreen: Screen = .cleo
        ContentView(screenToShow: previewScreen)
            .preferredColorScheme(.dark)
        ContentView(screenToShow: previewScreen)
            .preferredColorScheme(.light)
        ContentView(screenToShow: previewScreen)
            .previewDevice("iPhone 13 Pro Max")
            .preferredColorScheme(.dark)
        ContentView(screenToShow: previewScreen)
            .previewDevice("iPhone 13 Pro Max")
            .preferredColorScheme(.light)
        ContentView(screenToShow: previewScreen)
            .previewDevice("iPhone 11")
            .preferredColorScheme(.dark)
        ContentView(screenToShow: previewScreen)
            .previewDevice("iPhone 11")
            .preferredColorScheme(.light)
    }
}
