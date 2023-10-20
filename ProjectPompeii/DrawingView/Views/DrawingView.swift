//
//  DrawingView.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 05/06/23.
//

import SwiftUI

struct DrawingView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var viewModel = DrawingViewModel()
    
    var body: some View {
        
        ZStack {
        
            VStack {
                
                DrawingTopView(viewModel: viewModel)
                Spacer()
                DrawingMidView(viewModel: viewModel)
                Spacer()
                DrawingBottomView(viewModel: viewModel)
                
            }
            
            switch viewModel.displayedAlert {
                
                case .leaving:
                    CustomLeavingAlertView(drawingViewModel: viewModel)
                case .pausing:
                    CustomPausingAlertView(drawingViewModel: viewModel)
                case .timesUp:
                    CustomTimesUpAlertView(drawingViewModel: viewModel)
                case .none:
                    EmptyView()
                            
            }

        }
        .padding(.horizontal, 20)
        .customBackground()
        .navigationBarBackButtonHidden()
        
    }
    
}

struct DrawingViewRefactor_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
    }
}
