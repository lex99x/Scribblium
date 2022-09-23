//
//  HomeViewSolo.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 14/09/22.
//

import SwiftUI

struct HomeViewSolo: View {
    
    @Binding var navigationBond: NavigationBond
    
    @State var showTutorial = false
    @State private var showCredits = false
    @State private var isShowingAlert = false
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                HStack {
                    
//                    Button(action: { print("Sound button pressed") }) {
//
//                        Circle()
//                            .frame(width: 60, height: 60)
//                            .foregroundColor(Color("Contorno"))
//                            .overlay(
//                                Circle()
//                                    .strokeBorder(Color("SecondaryColor-1"), lineWidth: 3)
//                            )
//                            .overlay(Image("sound on").resizable().frame(width: 20, height: 20))
//
//                    }
                    
                    Spacer()
                    
                    Button(action: {
                        showTutorial.toggle()
                        isShowingAlert = true
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
                            .overlay(Image("start icon").resizable().frame(width: 30, height: 30))
                        
                    }
                    .disabled(isShowingAlert)
                    
                    Text("go scribblium!")
                        .foregroundColor(.white)
                        .font(.custom("Rubik-Regular", size: 14))
                        .multilineTextAlignment(.center)
                    
                }
//                .padding()
                
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
            
            if showTutorial {
                CustomAlertTutorial(shown: $showTutorial, isShowingAlert: $isShowingAlert)
            }
            
        }
        
    }
    
}

//struct HomeViewSolo_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeViewSolo()
//            .preferredColorScheme(.dark)
//        HomeViewSolo()
//            .preferredColorScheme(.light)
//        HomeViewSolo()
//            .previewDevice("iPhone 13 Pro Max")
//            .preferredColorScheme(.dark)
//        HomeViewSolo()
//            .previewDevice("iPhone 13 Pro Max")
//            .preferredColorScheme(.light)
//        HomeViewSolo()
//            .previewDevice("iPhone 11")
//            .preferredColorScheme(.dark)
//        HomeViewSolo()
//            .previewDevice("iPhone 11")
//            .preferredColorScheme(.light)
//    }
//}
