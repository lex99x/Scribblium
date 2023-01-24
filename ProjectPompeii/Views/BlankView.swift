//
//  BlankView.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 23/01/23.
//

import Foundation
import SwiftUI
import GameKit

struct BlankView: View {
    
    @AppStorage("GKGameCenterViewControllerState") var gameCenterViewControllerState: GKGameCenterViewControllerState = .default
    @AppStorage("IsGameCenterActive") var isGKActive = false
    
    var body: some View {
        
        VStack {
                    
            Button("Submit Random Score") {
                                
                Task {
                    let score = Int.random(in: 1...100)
                    print(score)
                    await GameCenterManager.updateLeaderboard(score: score)
                }
                            
            }
            
            Button("Show Game Center") {
                gameCenterViewControllerState = .leaderboards
                isGKActive = true
            }
            .sheet(isPresented: $isGKActive) {
                GameCenterView(format: gameCenterViewControllerState)
            }
            
        }
        .onAppear() {
            
            if !GKLocalPlayer.local.isAuthenticated {
                GameCenterManager.authenticateUser()
            }
            
        }
        
    }
    
}
