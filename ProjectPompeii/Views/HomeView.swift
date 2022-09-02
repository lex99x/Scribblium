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
    
    @State private var showQRCode = false
    @State private var showQRCodeScanner = false

    
    var body: some View {
        
        ZStack(alignment: .center) {
            
            Color("launchScreenBackground")
                .ignoresSafeArea()
            //background(Color("launchScreenBackground"))
            
            Image("padraoPortrait")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            
            VStack(alignment: .center, spacing: 39){
                HStack(alignment: .center, spacing: 153) {
                    
                    VStack(alignment: .center){
                        Button(action: {
                                
                            showQRCode.toggle()
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
                                .overlay(Image(systemName: "qrcode").resizable().frame(width: 43, height: 43).foregroundColor(Color("TertiaryColor-1")))
                        }
                        
                        Text("Host Game")
                            .foregroundColor(.white)
                            .font(.custom("Rubik-Italic-VariableFont_wght", size: 14))
                            .multilineTextAlignment(.center)
                            
                            //QRCodeView(isShowing: $showQRCode)
                    }.sheet(isPresented: $showQRCode) {
                            QRCodeView()
                    }
                    
                    VStack {
                        Button(action: {
                            
                            showQRCodeScanner.toggle()
                            //gameConnectionService.startAdvertising()
                        }) {
                            Circle()
                                .frame(width: 83, height: 83)
                                .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                                .overlay(
                                    Circle()
                                        .strokeBorder(Color("Contorno"), lineWidth: 3)
                                    )
                                .overlay(Image(systemName: "viewfinder").resizable().frame(width: 43, height: 43).foregroundColor(Color("TertiaryColor-1")))
                        }
                        
                        Text("Join Game")
                            .foregroundColor(.white)
                            .font(.custom("Rubik-Italic-VariableFont_wght", size: 14))
                            .multilineTextAlignment(.center)
                        
                    }
                    .sheet(isPresented: $showQRCodeScanner) {
                        QRCodeScannerView()
                    }

                }
                Image("friendos lightmode")
            }
            .offset(y: -100)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
