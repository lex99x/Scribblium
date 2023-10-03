//
//  GameCenterManager.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 18/01/23.
//

import Foundation
import GameKit

class GameCenterManager {
    
    public static let leaderboardsIdentifier = "com.devacademymao.ProjectPompeii.leaderboards"
    
    static func authenticateUser() {
        GKLocalPlayer.local.authenticateHandler = { vc, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
        }
    }
    
    static func updateLeaderboard(score: Int) async {
                
        Task {
            
            try await GKLeaderboard.submitScore(
                score,
                context: 0,
                player: GKLocalPlayer.local,
                leaderboardIDs: [GameCenterManager.leaderboardsIdentifier]
            )
            
        }
        
    }
    
}
