//
//  DrawingBottomView.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 07/06/23.
//

import SwiftUI

struct DrawingBottomView: View {
    
    @ObservedObject var viewModel: DrawingViewModel
    
    var body: some View {
        
        VStack {
            
            Text(NSLocalizedString(viewModel.suggestion, comment: ""))
                .foregroundColor(.secondaryColor1)
                .font(.custom(Font.rubikBlackFont, size: 32))
                .frame(maxWidth: 148, maxHeight: 36)
                .minimumScaleFactor(0.1)
            
            HStack {
                
                VStack {
                    Button(action: {
                        viewModel.deleteButtonAction()
                    }) {}
                    .buttonStyle(DeleteButtonStyle())
                    .disabled(viewModel.displayedAlert != .none)
                    
                    Text("delete")
                        .foregroundColor(.textPaperColor)
                        .font(.custom(Font.rubikRegularFont, size: 14))
                        .frame(maxWidth: 41, maxHeight: 21)
                        .minimumScaleFactor(0.1)
                }
                
                Spacer()
                
                VStack {
                    Button(action: {
                        viewModel.skipButtonAction()
                    }) {}
                    .buttonStyle(SkipButtonStyle())
                    .disabled(viewModel.displayedAlert != .none)
                    
                    Text("skip")
                        .foregroundColor(.textPaperColor)
                        .font(.custom(Font.rubikRegularFont, size: 14))
                        .frame(maxWidth: 30, maxHeight: 21)
                        .minimumScaleFactor(0.1)
                }
                
            }
            
        }
        
    }
}

struct DrawingBottomView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingBottomView(viewModel: DrawingViewModel())
            .preferredColorScheme(.dark)
    }
}
