//
//  HapticManager.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 27/09/22.
//

import SwiftUI

class HapticsHelper {
    
    static var instance = HapticsHelper()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    
}
