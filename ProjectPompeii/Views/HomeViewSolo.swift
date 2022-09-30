//
//  HomeViewSolo.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 14/09/22.
//

import SwiftUI

struct HomeViewSolo: View {
    
    @Binding var navigationBond: NavigationBond
    
    //@State var showTutorial = false
    @State private var showCredits = false
    @State private var showHowToPlay = false
    @State private var isShowingAlert = false
    @State private var isSoundOn = true
    @State private var isTapped = false
    @State var count = 0
    
    //@Binding var isSoundOn: Bool
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                HStack {

                    Button(action: {
                        //navigationBond.setData(count)
                        
                        count += 1

                        if(count%2 == 0) {
                            isTapped = false
                            isSoundOn = true
                        }
                        else {
                            isTapped = true
                            isSoundOn = false
                        }
                        

                        print(isSoundOn)
                        navigationBond.setData(isSoundOn)
                        print("Sound button pressed")
                        
                    }) {

                        Circle()
                            .frame(width: 60, height: 60)
                            .foregroundColor(Color("Contorno"))
                            .overlay(
                                Circle()
                                    .strokeBorder(Color("SecondaryColor-1"), lineWidth: 3)
                            )
                            .overlay(Image(isTapped ? "sound off" : "sound on").resizable().frame(width: 20, height: 20))

                    }
                    
                    Spacer()
                    
                    Button(action: {
                        showHowToPlay.toggle()
                    }) {
                        
                        Circle()
                            .frame(width: 60, height: 60)
                            .foregroundColor(Color("SecondaryColor-1"))
                            .overlay(
                                Circle()
                                    .strokeBorder(Color("Contorno"), lineWidth: 3)
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
                            .foregroundColor(Color("SecondaryColor-1"))
                            .overlay(
                                Circle()
                                    .strokeBorder(Color("Contorno"), lineWidth: 3)
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
                
//                Image("Logo Scribblium")
                Image("Homesolodarkmode")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 342, height: 342) // Remover dimensões fixas
                    .padding()
                
                Spacer()
                
                VStack {
                    
                    Button(action: {
                        
                        print("Start button pressed")
    
                        withAnimation {
                            navigationBond = NavigationBond(destination: .canvas, data: isSoundOn)
                            navigationBond.setDestination(.canvas)
                        }
                        
                    }) {
                        
                        Circle()
                            .frame(width: 75, height: 75)
                            .foregroundColor(Color("SecondaryColor-1"))
                            .overlay(
                                Circle()
                                    .strokeBorder(Color("Contorno"), lineWidth: 3)
                            )
                            .overlay(Image(systemName: "play.fill").resizable().frame(width: 22, height: 22.96).foregroundColor(Color("TertiaryColor-1")))
                        
                    }
                    .disabled(isShowingAlert)
                    
                    Text("go scribblium!")
                        .foregroundColor(.white)
                        .font(.custom("Rubik-Regular", size: 14))
                        .multilineTextAlignment(.center)
                    
                }
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color("DrawBackground")
                    .ignoresSafeArea()
                Image("padraoPortrait")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
            .statusBarHidden(true)
            
        }
        
    }
    
}

struct HomeViewSolo_Previews: PreviewProvider {
    static var previews: some View {
        let navigationBond = NavigationBond(destination: .canvas)
        HomeViewSolo(navigationBond: .constant(navigationBond))
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12")
//        HomeViewSolo(navigationBond: .constant(navigationBond))
//            .preferredColorScheme(.light)
//            .previewDevice("iPhone 12")
//        HomeViewSolo(navigationBond: .constant(navigationBond))
//            .previewDevice("iPhone 13 Pro Max")
//            .preferredColorScheme(.dark)
//        HomeViewSolo(navigationBond: .constant(navigationBond))
//            .previewDevice("iPhone 13 Pro Max")
//            .preferredColorScheme(.light)
//        HomeViewSolo(navigationBond: .constant(navigationBond))
//            .previewDevice("iPhone 11")
//            .preferredColorScheme(.dark)
//        HomeViewSolo(navigationBond: .constant(navigationBond))
//            .previewDevice("iPhone 11")
//            .preferredColorScheme(.light)
    }
}
