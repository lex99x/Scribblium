//
//  UserModel.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 17/08/22.
//

import Foundation
import MultipeerConnectivity

class DevicesList: ObservableObject {
    @Published var devices: [PlayerModel] = []
}

struct PlayerModel: Identifiable {
    
    var id = UUID()
    
    let nickname: String
    
}
