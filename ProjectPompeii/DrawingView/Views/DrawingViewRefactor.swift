//
//  DrawingViewRefactor.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 05/06/23.
//

import SwiftUI

struct DrawingViewRefactor: View {
    
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
            
            if viewModel.isLeaving {
                CustomLeavingAlertView(unpauseAction: viewModel.unpauseAction)
            }

            if viewModel.isPaused {
                CustomPausingAlertView(unpauseAction: viewModel.unpauseAction)
            }

            if viewModel.isTimeUp {
                CustomTimesUpAlertView()
            }

        }
        .padding(.horizontal, 20)
        .customBackground()
        
    }
    
}

struct DrawingViewRefactor_Previews: PreviewProvider {
    
    static var previews: some View {
        DrawingViewRefactor(viewModel: DrawingViewModel())
    }
    
}
