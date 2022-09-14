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
        ContentView(screenToShow: .home)
    }
}
