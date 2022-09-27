//
//  ClioView.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 25/08/22.
//

import SwiftUI

struct CleoView: View {
        
    @Binding var navigationBond: NavigationBond

    var body: some View {
        
        ZStack {
            VStack {
                VStack (spacing: 20){
                    Text("Hi, I'm CLE/O and I brought your score!")
                        .font(.custom("RubikMarkerHatch-Regular", size: 32))
                        .frame(maxWidth: 227, maxHeight: 114)
                        .minimumScaleFactor(0.1)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                        .foregroundColor(Color("SecondaryColor-1"))
                        .padding([.top], 50)
                        .padding([.horizontal], 80)
                    
                    ZStack {
                        Circle()
                            .frame(maxWidth: 83, maxHeight: 83)
                            .foregroundColor(Color("TimerBackground"))
                            .overlay(
                                Circle()
                                    .strokeBorder(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)), lineWidth: 3))
                        
                        Text(String(navigationBond.getData() as! Int))
                            .font(.custom("Rubik-Black", size: 32))
                            .frame(maxWidth: 46, maxHeight: 38)
                            .minimumScaleFactor(0.1)
                            .foregroundColor(.white)
                    }
                    .padding([.horizontal], 80)
                    
                    Text("Do you think you can do better?")
                        .font(.custom("Rubik-Black", size: 26))
                        .frame(maxWidth: 271, maxHeight: 57)
                        .minimumScaleFactor(0.1)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(2)
                        .foregroundColor(Color("SecondaryColor-1"))
                        .padding([.horizontal], 80)
                    
                }
                
                Spacer()
                
                HStack {
                    VStack {
                        Button(action: {
                            withAnimation {
                                navigationBond.setDestination(.home)
                            }
                        }) {
                            ZStack {
                                Circle()
                                    .frame(maxWidth: 62, maxHeight: 62)
                                    .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                                    .overlay(
                                        Circle()
                                            .strokeBorder(Color("Contorno"), lineWidth: 3))
                                Image("home again icon")
                                    .resizable()
                                    .frame(maxWidth: 22,maxHeight: 22)
                            }
                        }
                            
                        Text("home")
                            .foregroundColor(.white)
                            .font(.custom("Rubik-Regular", size: 14))
                            .frame(maxWidth: 37, maxHeight: 21)
                            .minimumScaleFactor(0.1)
                            .multilineTextAlignment(.center)
                    }
                    .padding([.leading], 24)
                    .padding([.bottom], 35)
                    
                    Spacer()
                        
                    VStack {
                        Button(action: {
                            withAnimation {
                                navigationBond.setDestination(.canvas)
                            }
                        }) {
                            ZStack(alignment: .center){
                                Circle()
                                    .frame(maxWidth: 62, maxHeight: 62)
                                    .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                                    .overlay(
                                        Circle()
                                            .strokeBorder(Color("Contorno"), lineWidth: 3)
                                    )
                                Image("play again icon")
                                    .resizable()
                                    .frame(maxWidth: 40,maxHeight: 40)
                            }
                        }
                            
                        Text("play again")
                            .foregroundColor(.white)
                            .font(.custom("Rubik-Regular", size: 14))
                            .frame(maxWidth: 66, maxHeight: 21)
                            .minimumScaleFactor(0.1)
                            .multilineTextAlignment(.center)
                    }
                    .padding([.trailing], 24)
                    .padding([.bottom], 35)
                }
            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color("CleoBackgroundColor")
                .ignoresSafeArea()
            Image("padraoPortrait")
                .resizable(resizingMode: .tile)
                .scaledToFill()
                .ignoresSafeArea()
            Image("Cleofelizlightmodeolhosabertos")
                .resizable()
                .frame(maxWidth: 428, maxHeight: 926)
                .minimumScaleFactor(0.1)
                //.scaledToFill()
                .ignoresSafeArea()
        }
       .statusBarHidden(true)
    }
}

struct CleoView_Previews: PreviewProvider {
    
    static var previews: some View {
        let navigationBond = NavigationBond(destination: .home, data: 100)
        CleoView(navigationBond: .constant(navigationBond))
            .preferredColorScheme(.light)
        CleoView(navigationBond: .constant(navigationBond))
            .preferredColorScheme(.dark)
    }
    
}
