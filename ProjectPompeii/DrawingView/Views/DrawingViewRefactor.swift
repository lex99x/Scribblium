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
            
            switch viewModel.displayedAlert {
                
                case .leaving:
                    CustomLeavingAlertView(viewModel: viewModel)
                case .pausing:
                    CustomPausingAlertView(viewModel: viewModel)
                case .timesUp:
                    CustomTimesUpAlertView()
                case .none:
                    EmptyView()
                            
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
