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
                
                ZStack(alignment: .top) {
                    
                    Image("ModalHowToPlay")
                        .resizable()
                    //sombra especifica
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
                                .foregroundColor(.secondaryColor1)
                                .overlay(
                                    Circle()
                                        .strokeBorder(Color.contorno, lineWidth: 2))
                                .font(.system(size: 30))
                                .background(
                                    Circle()
                                        .foregroundColor(.tertiaryColor1)
                                )
                        }
                    }
//                    .padding([.bottom], 295)
                    .padding(.top, 15)
                    .padding([.trailing], 15)
        
                }
                
                VStack (alignment: .leading, spacing: 16) {
                    
                    Text("howToPlay")
                        .font(.custom("Rubik-Bold", size: 20))
                        .minimumScaleFactor(0.1)
                        .foregroundColor(.secondaryColor1)
                    
                    Text("howToPlayDetails")
                        .font(.custom("Rubik-Regular", size: 17))
                        .minimumScaleFactor(0.1)
                        .foregroundColor(.textPaperColor)
                }
                .padding(.bottom)
                .padding([.horizontal], 26)
                
                VStack (alignment: .leading, spacing: 16) {
                    
                    Text("meetCleo")
                        .font(.custom("Rubik-Bold", size: 20))
                        .minimumScaleFactor(0.1)
                        .foregroundColor(.secondaryColor1)
                    
                    Text("meetCleoDetails")
                        .font(.custom("Rubik-Regular", size: 17))
                        .minimumScaleFactor(0.1)
                        .foregroundColor(.textPaperColor)
                    
                }
                .padding(.bottom)
                .padding([.horizontal], 26)
                
                VStack (alignment: .leading, spacing: 16) {
                    
                    Text("learnAboutScore")
                        .font(.custom("Rubik-Bold", size: 20))
                        .minimumScaleFactor(0.1)
                        .foregroundColor(.secondaryColor1)
                    
                    Text("learnAboutScoreDetails")
                        .font(.custom("Rubik-Regular", size: 17))
                        .minimumScaleFactor(0.1)
                        .foregroundColor(.textPaperColor)
                    
                }
                .padding(.bottom)
                .padding([.horizontal], 26)
                
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.backgroundDrawView)
        //.cornerRadius(18)
        //.ignoresSafeArea()
    }

}

struct HowToPlayView_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayView()
    }
}
