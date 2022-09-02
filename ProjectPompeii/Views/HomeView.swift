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
        
        ZStack(alignment: .center) {
            
            Color("launchScreenBackground")
                .ignoresSafeArea()
            
            Image("padraoPortrait")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            
            VStack(alignment: .center, spacing: 39){
                HStack(alignment: .top, spacing: 153) {
                    
                    VStack{
                        Button(action: {
                            
            //                gameConnectionService.startBrowsing()
            //                for device in devicesList.devices {
            //                    print(device)
            //                }
                            
                        }) {
                            Circle()
                                .frame(width: 83, height: 83)
                                .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                                .overlay(
                                    Circle()
                                        .strokeBorder(Color("Contorno"), lineWidth: 3)
                                    )
                                .overlay(Image(systemName: "qrcode").frame(width: 63, height: 63).foregroundColor(Color("Contorno")))
                        }
                        
                        Text("Host Game")
                            .foregroundColor(.white)
                            .font(.custom("Rubik-Italic-VariableFont_wght", size: 14))
                            .multilineTextAlignment(.center)
                            
                    }
                    
                    VStack {
                        Button(action: {
                            gameConnectionService.startAdvertising()
                        }) {
                            Circle()
                                .frame(width: 83, height: 83)
                                .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                                .overlay(
                                    Circle()
                                        .strokeBorder(Color("Contorno"), lineWidth: 3)
                                    )
                                .overlay(Image(systemName: "viewfinder").frame(width: 63, height: 63).foregroundColor(Color("Contorno")))
                        }
                        
                        Text("Join Game")
                            .foregroundColor(.white)
                            .font(.custom("Rubik-Italic-VariableFont_wght", size: 14))
                            .multilineTextAlignment(.center)
                        
                    }

                }
                Image("friendos lightmode")
            }
            .offset(y: -100)
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
