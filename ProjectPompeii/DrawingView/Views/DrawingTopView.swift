//
//  DrawingTopView.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 05/06/23.
//

import SwiftUI

struct DrawingTopView: View {
    
    @ObservedObject var viewModel: DrawingViewModel
    
    var body: some View {
        VStack {
            HStack {
                
                Button(action: {
                    viewModel.backButtonAction()
                }) {}
                .buttonStyle(BackButtonStyle())
                .disabled(viewModel.isDisplayingAlert)
                
                ZStack {
                    
                    Circle()
                        .frame(maxWidth: 62, maxHeight: 62)
                        .foregroundColor(.backgroundTimerColor)
                        .overlay(
                            Circle()
                                .strokeBorder(Color.secondaryColor1, lineWidth: 3))
                    
                    Text("\(viewModel.currentTime)")
                        .font(.custom(Font.rubikBlackFont, size: 32))
                        .frame(maxWidth: 38, maxHeight: 31)
                        .minimumScaleFactor(0.1)
                        .foregroundColor(.textPaperColor)
                        .onReceive(viewModel.timer) { _ in
                            viewModel.decrementTimer()
                        }
                    
                }
                
                Spacer()
                
                Button(action: {
                    viewModel.pauseAction()
                }) {}
                .buttonStyle(PauseButtonStyle())
                .disabled(viewModel.isDisplayingAlert)
                
            }
            
            Text(viewModel.feedback)
                .font(.custom(Font.rubikBlackFont, size: 20))
//                .frame(maxHeight: 24)
                .minimumScaleFactor(0.1)
//                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondaryColor1)
//                .frame(maxWidth: 318)
            
        }
    }
    
}

struct DrawingTopView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingTopView(viewModel: DrawingViewModel())
            .preferredColorScheme(.dark)
    }
}
