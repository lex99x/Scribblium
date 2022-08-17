//
//  Drawing.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 17/08/22.
//

import Foundation

struct DrawModel {
    
    public static func getRandomDrawing() -> String {
        
        let drawings = ["Apple", "Orange", "Sun", "Moon", "Door", "Chair", "Dog", "Cat", "Book", "Pencil"]
        
        return drawings.randomElement() ?? "Banana"
        
    }
    
}
