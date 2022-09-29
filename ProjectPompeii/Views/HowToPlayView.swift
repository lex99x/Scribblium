//
//  HowToPlayView.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 29/09/22.
//

import SwiftUI

struct HowToPlayView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ScrollView {
            VStack (alignment: .leading) {
                
                ZStack {
                    
                    Image("ModalHowToPlay")
                        .resizable()
                        .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 11, x: -1, y: 6)
                        .ignoresSafeArea()
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color("SecondaryColor-1"))
                                .overlay(
                                    Circle()
                                        .strokeBorder(Color("Contorno"), lineWidth: 2))
                                .font(.system(size: 30))
                                .background(
                                    Circle()
                                        .foregroundColor(Color("TertiaryColor-1"))
                                )
                        }
                    }
                    .padding([.bottom], 294)
                    .padding([.trailing], 14)
                }
                
                VStack (alignment: .leading, spacing: 16) {
                    
                    Text("How to Play?")
                        .font(.custom("Rubik-Bold", size: 20))
                        .minimumScaleFactor(0.1)
                        .foregroundColor(Color("SecondaryColor-1"))
                    
                    Text("There's only one rule here... Draw as many scribbliuns as you can in 30 seconds!")
                        .font(.custom("Rubik-Regular", size: 17))
                        .minimumScaleFactor(0.1)
                        .foregroundColor(Color(UIColor(red: 1.00, green: 0.98, blue: 0.86, alpha: 1.00)))
                }
                .padding(.bottom)
                .padding([.horizontal], 26)
                
                VStack (alignment: .leading, spacing: 16) {
                    
                    Text("Meet our AI CLE/O")
                        .font(.custom("Rubik-Bold", size: 20))
                        .minimumScaleFactor(0.1)
                        .foregroundColor(Color("SecondaryColor-1"))
                    
                    Text("It evaluates in real time if what you are drawing corresponds to what was requested.")
                        .font(.custom("Rubik-Regular", size: 17))
                        .minimumScaleFactor(0.1)
                        .foregroundColor(Color(UIColor(red: 1.00, green: 0.98, blue: 0.86, alpha: 1.00)))
                    
                }
                .padding(.bottom)
                .padding([.horizontal], 26)
                
                VStack (alignment: .leading, spacing: 16) {
                    
                    Text("Learn more about your score!")
                        .font(.custom("Rubik-Bold", size: 20))
                        .minimumScaleFactor(0.1)
                        .foregroundColor(Color("SecondaryColor-1"))
                    
                    Text("At the end of each round you score according to: the difficulty of the scribblium, the speed of what is drawn and the number of scribbliuns!")
                        .font(.custom("Rubik-Regular", size: 17))
                        .minimumScaleFactor(0.1)
                        .foregroundColor(Color(UIColor(red: 1.00, green: 0.98, blue: 0.86, alpha: 1.00)))
                    
                }
                .padding(.bottom)
                .padding([.horizontal], 26)
                
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("DrawBackground"))
        //.cornerRadius(18)
        .ignoresSafeArea()
    }

}

struct HowToPlayView_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayView()
    }
}
