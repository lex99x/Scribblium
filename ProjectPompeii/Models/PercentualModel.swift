//
//  PercentualModel.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 26/08/22.
//

import Foundation

struct PercentualModel {
    
    public static func getRandomPercentual() -> String {
        
        let numbers = ["0%", "25%", "50%", "75%"]
        
        return numbers.randomElement() ?? "100%"
        
    }
    
}
