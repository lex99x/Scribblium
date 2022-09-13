//
//  GameModel.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 01/09/22.
//

import Foundation

class MatchModel {
    
    static func calculateScore(timings: [Int]) -> Int {
        
        var score = 0
        
        for timing in timings {
            score += timing
        }
        
        return score
        
    }
    
}
