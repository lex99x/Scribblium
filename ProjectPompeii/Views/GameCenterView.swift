//
//  GameCenterView.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 23/01/23.
//

import Foundation
import GameKit
import SwiftUI

public struct GameCenterView: UIViewControllerRepresentable {
    
    let viewController: GKGameCenterViewController
    @AppStorage("IsGameCenterActive") var isGKActive = false

    public init(viewController: GKGameCenterViewController = GKGameCenterViewController(), format: GKGameCenterViewControllerState = .default ) {
        self.viewController = GKGameCenterViewController(state: format)
    }

    public func makeUIViewController(context: Context) -> GKGameCenterViewController {
        let gkVC = viewController
        gkVC.gameCenterDelegate = context.coordinator
        return gkVC
    }

    public func updateUIViewController(_ uiViewController: GKGameCenterViewController, context: Context) {
        return
    }

    public func makeCoordinator() -> GKCoordinator {
        return GKCoordinator(self)
    }
    
}

public class GKCoordinator: NSObject, GKGameCenterControllerDelegate {
    
    var view: GameCenterView

    init(_ gkView: GameCenterView) {
        self.view = gkView
    }

    public func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
        view.isGKActive = false
    }
    
}
