//
//  HapticManager.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 27/09/22.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static var instance = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    
}
