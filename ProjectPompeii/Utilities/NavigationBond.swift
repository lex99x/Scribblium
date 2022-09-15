//
//  NavigationModel.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 15/09/22.
//

import Foundation

enum Screen {
    
    case home, canvas, cleo
    
}

struct NavigationBond {
    
    private var destination: Screen
    private var data: Any?
    
    init(destination: Screen) {
        self.destination = destination
    }

    init(destination: Screen, data: Data) {
        self.destination = destination
        self.data = data
    }

    func getDestination() -> Screen {
        return destination
    }
    
    mutating func setDestination(_ destination: Screen) {
        self.destination = destination
    }

    func getData() -> Any? {
        return data
    }

    mutating func setData(_ data: Any) {
        self.data = data
    }
    
}
