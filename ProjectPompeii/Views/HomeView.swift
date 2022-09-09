//
//  HomeView.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 01/09/22.
//

import SwiftUI
import CodeScanner

struct HomeView: View {
    
//    @EnvironmentObject var devicesList: DevicesList
    @ObservedObject var connection: GameConnectionService
    
    @State private var showQRCode = false
    @State private var showQRCodeScanner = false
    
    @State var isShowingScanner = false
    @State var scannedCode: String = "Scan a QR Code to get started."
    
    init() {
        self.connection = GameConnectionService()
    }
    
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
                            connection.startAdvertising()
                            showQRCode.toggle()
                        }) {
                            Circle()
                                .frame(width: 83, height: 83)
                                .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                                .overlay(
                                    Circle()
                                        .strokeBorder(Color("Contorno"), lineWidth: 3)
                                )
                                .overlay(Image("icone qr").resizable().frame(width: 43, height: 43))
                        }
                        
                        Text("Host Game")
                            .foregroundColor(.white)
                            .font(.custom("Rubik-Regular", size: 14))
                            .multilineTextAlignment(.center)
                        
                        //QRCodeView(isShowing: $showQRCode)
                    }
                    .sheet(isPresented: $showQRCode, onDismiss: didDismiss) {
                        QRCodeView(connection: self.connection)
                    }
                    
                    VStack {
                        Button(action: {
                            showQRCodeScanner.toggle()
                            connection.startBrowsing()
                        }) {
                            Circle()
                                .frame(width: 83, height: 83)
                                .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                                .overlay(
                                    Circle()
                                        .strokeBorder(Color("Contorno"), lineWidth: 3)
                                )
                                .overlay(Image("ícone ler qr").resizable().frame(width: 43, height: 43))
                        }
                        
                        Text("Join Game")
                            .foregroundColor(.white)
                            .font(.custom("Rubik-Regular", size: 14))
                            .multilineTextAlignment(.center)
                        
                    }
                    .sheet(isPresented: $showQRCodeScanner) {
                        CodeScannerView(codeTypes: [.qr], completion: {
                            result in
                            if case let .success(code) = result {
                                self.scannedCode = code.string
                                self.isShowingScanner = false
                            }
                        })
                    }
                }
                ZStack{
                    Image("friendos lightmode novo")
                    Image("starsfriendos")
                        .padding([.bottom], 220)
                }
            }
            .offset(y: -100)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
    }
}

private extension HomeView {
    
    func didDismiss() {
        print("Disimssed view")
    }
}
