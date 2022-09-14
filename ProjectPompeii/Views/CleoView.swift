//
//  ClioView.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 25/08/22.
//

import SwiftUI

struct CleoView: View {
    
    @Binding var screenToShow: Screen

    var body: some View {
        VStack (spacing: 20){
                Text("Hi, I'm CLE/O and I brought your score!")
                    .font(.custom("RubikMarkerHatch-Regular", size: 32))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("SecondaryColor-1"))
                    .frame(width: UIScreen.main.bounds.width - 163, height: UIScreen.main.bounds.height - 730)
                    .padding([.top], 50)
            
                ZStack {
                    Circle()
                        .frame(width: UIScreen.main.bounds.width - 307, height: UIScreen.main.bounds.height - 761)
                        .foregroundColor(Color("TimerBackground"))
                        .overlay(
                            Circle()
                            .strokeBorder(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)), lineWidth: 3))
                    
                    Text("50")
                        .font(.custom("Rubik-Black", size: 32))
                        .foregroundColor(.white)
                }
                
                Text("Do you think you can do better?")
                    .font(.custom("Rubik-Black", size: 26))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(Color("SecondaryColor-1"))
                    .frame(width: UIScreen.main.bounds.width - 119, height: UIScreen.main.bounds.height - 787)
                
            Spacer()
            
                HStack (spacing: 172){
                    VStack {
                        Button(action: {
                            withAnimation {
                                screenToShow = .home
                            }
                        }) {
                            ZStack {
                                Circle()
                                    .frame(width: UIScreen.main.bounds.width - 307, height: UIScreen.main.bounds.height - 761)
                                    .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                                    .overlay(
                                        Circle()
                                            .strokeBorder(Color("Contorno"), lineWidth: 3))
                                Image("home again icon")
                            }
                        }
                        
                        Text("home")
                            .foregroundColor(.white)
                            .font(.custom("Rubik-Regular", size: 14))
                            .multilineTextAlignment(.center)
                    }
                    
                    
                    VStack {
                        Button(action: {
                            withAnimation {
                                screenToShow = .canvas
                            }
                        }) {
                            ZStack(alignment: .center){
                                Circle()
                                    .frame(width: UIScreen.main.bounds.width - 307, height: UIScreen.main.bounds.height - 761)
                                    .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                                    .overlay(
                                        Circle()
                                            .strokeBorder(Color("Contorno"), lineWidth: 3)
                                    )
                                Image("play again icon")
                            }
                        }
                        
                        Text("play again")
                            .foregroundColor(.white)
                            .font(.custom("Rubik-Regular", size: 14))
                            .multilineTextAlignment(.center)
                    }
                }
                .padding([.bottom], 28)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            //.background(Color("launchScreenBackground").ignoresSafeArea().scaledToFill())
            .background(
                
                Image("Cleofelizlightmodeolhosabertos")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                    .background((Color("launchScreenBackground")))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            )
            

    }
}

//struct CleoView_Previews: PreviewProvider {
//    static var previews: some View {
//        CleoView()
//            .preferredColorScheme(.light)
//    }
//}
