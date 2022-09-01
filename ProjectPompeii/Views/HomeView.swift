//
//  HomeView.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 01/09/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var devicesList: DevicesList
    @EnvironmentObject var gameConnectionService: GameConnectionService
    
    var body: some View {
        
        HStack {
                
            Button(action: {
                
//                gameConnectionService.startBrowsing()
//                for device in devicesList.devices {
//                    print(device)
//                }
                
            }) {
                Text("Ler QR CODE")
            }.buttonStyle(.borderedProminent)
            
            Button(action: {
//                gameConnectionService.startAdvertising()
            }) {
                Text("Gerar QR CODE")
            }.buttonStyle(.borderedProminent)
            
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
