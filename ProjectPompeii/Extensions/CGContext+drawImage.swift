//
//  CGContext+drawImage.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 13/10/22.
//

import Foundation
import CoreGraphics

extension CGContext {
    
    final func drawImage(_ image: CGImage, in rect: CGRect) {
        
        let translationY: CGFloat = (rect.origin.y + rect.size.height)
        translateBy(x: 0, y: translationY)
        scaleBy(x: 1.0, y: -1.0)
        
        let rectOriginY = CGRect(x: rect.origin.x, y: 0, width: rect.width, height: rect.height)
        draw(image, in: rectOriginY)
        
        scaleBy(x: 1.0, y: -1.0)
        translateBy(x: 0, y: -translationY)
        
    }
    
}
