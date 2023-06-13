//
//  HomeView.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 14/09/22.
//

import SwiftUI
import GameKit

struct HomeView: View {
    
    @AppStorage("GKGameCenterViewControllerState") var gameCenterViewControllerState: GKGameCenterViewControllerState = .default
    @AppStorage("IsGameCenterActive") var isGKActive = false
    
    @Binding var navigationBond: NavigationBond
    
    @State private var showCredits = false
    @State private var showHowToPlay = false
    
    @State private var isShowingAlert = false
    @State private var isTapped = false
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        gameCenterViewControllerState = .leaderboards
                        isGKActive = true
                    }) {
                        Circle()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.secondaryColor1)
                            .overlay(
                                Circle()
                                    .strokeBorder(Color.contorno, lineWidth: 3)
                            )
                            .overlay(Image(systemName: "person.3.fill").resizable().frame(width: 40, height: 20).foregroundColor(.tertiaryColor1))
    
                    }
                    .sheet(isPresented: $isGKActive) {
                        GameCenterView(format: gameCenterViewControllerState)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        showHowToPlay.toggle()
                    }) {
                        
                        Circle()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.secondaryColor1)
                            .overlay(
                                Circle()
                                    .strokeBorder(Color.contorno, lineWidth: 3)
                            )
                            .overlay(Image("icontutorial").resizable().frame(width: 22, height: 27))
                        
                    }
                    .disabled(isShowingAlert)
                    .sheet(isPresented: $showHowToPlay){
                        HowToPlayView()
                    }
                    
                    Button(action: {
                        showCredits.toggle()
                    }) {
                        
                        Circle()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.secondaryColor1)
                            .overlay(
                                Circle()
                                    .strokeBorder(Color.contorno, lineWidth: 3)
                            )
                            .overlay(Image("iconlicense").resizable().frame(width: 21, height: 22))
                        
                    }
                    .disabled(isShowingAlert)
                    .sheet(isPresented: $showCredits){
                        CreditsView()
                    }
                    
                }
                .padding()
                
                Spacer()
                
                Image("Logo Scribblium")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 342, height: 342) // Remover dimensões fixas
                    .padding()
                
                Spacer()
                
                VStack {
                    
                    Button(action: {
                        withAnimation {
                            navigationBond.setDestination(.canvas)
                        }
                    }) {
                        
                        Circle()
                            .frame(width: 75, height: 75)
                            .foregroundColor(.secondaryColor1)
                            .overlay(
                                Circle()
                                    .strokeBorder(Color.contorno, lineWidth: 3)
                            )
                            .overlay(Image(systemName: "play.fill").resizable().frame(width: 22, height: 22.96).foregroundColor(.tertiaryColor1).padding(.leading, 4))
                        
                    }
                    .disabled(isShowingAlert)
                    
                }
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color.backgroundDrawView
                    .ignoresSafeArea()
                Image("padraoPortrait")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .opacity(0.5)
            }
            .statusBarHidden(true)
            
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let navigationBond = NavigationBond(destination: .canvas)
        HomeView(navigationBond: .constant(navigationBond))
    }
}
