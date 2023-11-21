//
//  ClioView.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 25/08/22.
//

import SwiftUI

struct CleoView: View {
    
    @Environment(\.dismiss) private var dismiss
    @AppStorage("IsStackingActive") private var isStackingActive: Bool?
    
    @ObservedObject var drawingViewModel: DrawingViewModel
    
    var body: some View {
        
        ZStack {
            VStack {
                VStack (spacing: 20){
                    Text("cleoBringsScore")
                        .font(.custom("Rubik-Black", size: 22))
                        .frame(maxWidth: 227, maxHeight: 114)
                        .minimumScaleFactor(0.1)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                        .foregroundColor(.secondaryColor1)
                        .padding([.top], 50)
                        .padding([.horizontal], 80)
                    
                    ZStack {
                        Circle()
                            .frame(maxWidth: 83, maxHeight: 83)
                            .foregroundColor(.backgroundTimerColor)
                            .overlay(
                                Circle()
                                    .strokeBorder(Color.secondaryColor1, lineWidth: 3))
                        Text("\(drawingViewModel.scoreCounter)")
                            .font(.custom("Rubik-Black", size: 32))
                            .frame(maxWidth: 46, maxHeight: 38)
                            .minimumScaleFactor(0.1)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 80)
                
                    Text("doYouBetter")
                        .font(.custom("Rubik-Black", size: 24))
                        .frame(maxWidth: 271, maxHeight: 57)
                        .minimumScaleFactor(0.1)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(2)
                        .foregroundColor(.secondaryColor1)
                        .padding(.horizontal, 80)
                }
                
                Spacer()
                
                HStack {
                    VStack {
                        Button(action: {
                            isStackingActive = false
                        }, label: {
                            ZStack {
                                Circle()
                                    .frame(maxWidth: 62, maxHeight: 62)
                                    .foregroundColor(.secondaryColor1)
                                    .overlay(
                                        Circle()
                                            .strokeBorder(Color.contornoColor, lineWidth: 3))
                                Image("home again icon")
                                    .resizable()
                                    .frame(maxWidth: 22,maxHeight: 22)
                            }
                        })
                        Text("home")
                            .foregroundColor(.textPaperColor)
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
                            drawingViewModel.reset()
                            dismiss()
                        }, label: {
                            ZStack(alignment: .center){
                                Circle()
                                    .frame(maxWidth: 62, maxHeight: 62)
                                    .foregroundColor(.secondaryColor1)
                                    .overlay(
                                        Circle()
                                            .strokeBorder(Color.contornoColor, lineWidth: 3)
                                    )
                                Image("play again icon")
                                    .resizable()
                                    .frame(maxWidth: 40,maxHeight: 40)
                            }
                        })
                        Text("replay")
                            .foregroundColor(.textPaperColor)
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background {
            Color.backgroundCleoViewColor
                .ignoresSafeArea()
            Image("padraoPortrait")
                .resizable(resizingMode: .tile)
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.5)
            Image("Cleofelizlightmodeolhosabertos")
                .resizable()
                .frame(maxWidth: 428, maxHeight: 926)
                .minimumScaleFactor(0.1)
                .scaledToFill()
                .ignoresSafeArea()
        }
       .statusBarHidden()
       .navigationBarBackButtonHidden()
        
    }
    
}

struct CleoView_Previews: PreviewProvider {
    static var previews: some View {
        CleoView(drawingViewModel: DrawingViewModel())
            .preferredColorScheme(.light)
            .previewDisplayName("Cleo View Light Mode")
        CleoView(drawingViewModel: DrawingViewModel())
            .preferredColorScheme(.dark)
            .previewDisplayName("Cleo View Dark Mode")
    }
}
