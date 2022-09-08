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
//            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
            HomeView()
        }
    }
}
