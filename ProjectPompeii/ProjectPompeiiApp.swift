//
//  ProjectPompeiiApp.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 16/08/22.
//

import SwiftUI

@main
struct ProjectPompeiiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            
            if (UserDefaults.standard.string(forKey: "playerNickname") == nil) {
                AppContentView()
            } else {
                ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            
        }
    }
}
