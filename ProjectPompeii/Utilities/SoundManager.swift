//
//  SoundManager.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 28/09/22.
//

import Foundation
import SwiftUI
import AVKit

class SoundManager {
    
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum sounds: String {
        case correct
    }
    
    func playSound(sound: sounds) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }
        
        catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}
