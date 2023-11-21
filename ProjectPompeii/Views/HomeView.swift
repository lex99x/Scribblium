//
//  HomeView.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 14/09/22.
//

import SwiftUI
import GameKit

struct HomeView: View {
        
    @AppStorage("IsGameCenterActive") private var isGKActive = false
    @AppStorage("IsStackingActive") private var isStackingActive = false
    
    @State private var isShowingHowToPlay = false
    @State private var isShowingCredits = false
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Button(action: {
                    isGKActive.toggle()
                }) {
                    Circle()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.secondaryColor1)
                        .overlay(
                            ZStack {
                                Circle()
                                    .strokeBorder(Color.contornoColor, lineWidth: 3)
                                Image(systemName: "person.3.fill")
                                    .resizable()
                                    .frame(width: 40, height: 20)
                                    .foregroundColor(.tertiaryColor1)
                            }
                        )
                }
                .sheet(isPresented: $isGKActive) {
                    GameCenterView(format: .leaderboards)
                }
                
                Spacer()
                
                Button(action: {
                    isShowingHowToPlay.toggle()
                }) {
                    Circle()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.secondaryColor1)
                        .overlay(
                            ZStack {
                                Circle()
                                    .strokeBorder(Color.contornoColor, lineWidth: 3)
                                Image("icontutorial")
                                    .resizable()
                                    .frame(width: 22, height: 27)
                                    .foregroundColor(.tertiaryColor1)
                            }
                        )
                }
                .sheet(isPresented: $isShowingHowToPlay){
                    HowToPlayView()
                }
                
                Button(action: {
                    isShowingCredits.toggle()
                }) {
                    Circle()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.secondaryColor1)
                        .overlay(
                            ZStack {
                                Circle()
                                    .strokeBorder(Color.contornoColor, lineWidth: 3)
                                Image("iconlicense")
                                    .resizable()
                                    .frame(width: 21, height: 22)
                                    .foregroundColor(.tertiaryColor1)
                            }
                        )
                }
                .sheet(isPresented: $isShowingCredits){
                    CreditsView()
                }
                
            }
            
            Spacer()
            
            Image("Logo Scribblium")
                .resizable()
                .scaledToFit()
                .frame(width: 342, height: 342) // TODO: refactor fixed dimensions
            
            Spacer()
            
            NavigationLink(
                destination: DrawingView(),
                isActive: $isStackingActive,
                label: {
                    Circle()
                        .frame(width: 75, height: 75)
                        .foregroundColor(.secondaryColor1)
                        .overlay(
                            ZStack {
                                Circle()
                                    .strokeBorder(Color.contornoColor, lineWidth: 3)
                                Image(systemName: "play.fill")
                                    .resizable()
                                    .frame(width: 22, height: 22.96)
                                    .foregroundColor(.tertiaryColor1)
                                    .padding(.leading, 4)
                            }
                        )
                })
            .isDetailLink(false)
            
        }
        .padding()
        .customBackground()
        .statusBarHidden()
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
