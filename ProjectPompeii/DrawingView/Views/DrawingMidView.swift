//
//  DrawingMidView.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 05/06/23.
//

import SwiftUI

struct DrawingMidView: View {
    
    @ObservedObject var viewModel: DrawingViewModel
    
    var body: some View {
        
        ZStack {
            
            CanvasView(viewModel: viewModel)
            
            HStack {
                Image.paperBandRight
                    .offset(x: -15)
                Spacer()
                Image.paperBandLeft
                    .offset(x: 15)
            }
            .offset(y: -210)
                        
            HStack {
                Image.paperBandLeft
                    .offset(x: -15)
                Spacer()
                Image.paperBandRight
                    .offset(x: 15)
            }
            .offset(y: 210)
            
        }
        
    }
    
}

struct DrawingMidView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingMidView(viewModel: DrawingViewModel())
    }
}
