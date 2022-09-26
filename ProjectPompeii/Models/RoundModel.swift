//
//  GameModel.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 01/09/22.
//

import Foundation

class RoundModel {
    
    static func calculateScore(timings: [Int]) -> Int {
        
        var score = 0
        
        for timing in timings {
            score += timing
        }
        
        return score
        
    }
    
    static func logScore(maxTime: Int, score: Int) {
        
        print("maxTime: " + String(maxTime))
        print("score: " + String(score) + "\n")
        
    }
    
}
