//
//  CanvasView.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 05/06/23.
//

import SwiftUI
import ConfettiSwiftUI

struct CanvasView: View {
    
    @ObservedObject var viewModel: DrawingViewModel
    
    var body: some View {
        
        ZStack {
            
            // Moldura
            RoundedRectangle(cornerRadius: 31)
                .frame(maxWidth: 338, maxHeight: 501)
                .foregroundColor(.secondaryColor1)
                .overlay {
                    RoundedRectangle(cornerRadius: 30)
                        .strokeBorder(Color.contorno, lineWidth: 3)
                }
                .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: 8, y: 7)
            
            // Quadro branco
            Canvas { context, size in
                for line in viewModel.lines {
                    var path  = Path()
                    path.addLines(line.points)
                    context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                }
            }
            .frame(maxWidth: 318, maxHeight: 482.51)
            .background {
                RoundedRectangle(cornerRadius: 31).inset(by: 3).foregroundColor(.textPaperColor)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 30)
                    .strokeBorder(Color.contorno, lineWidth: 3)
            }
            .cornerRadius(30)
            .gesture (
                DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onChanged({ value in
                        viewModel.onGestureChangedAction(value: value)
                    })
                    .onEnded({ value in
                        viewModel.onGestureEndedAction(value: value)
                    })
            )
            .disabled(viewModel.displayedAlert != .none)
            
            ConfettiCannon(counter: $viewModel.successCounter,
                           num: 13,
                           colors: [.tertiaryColor1, .primaryColor1, .secondaryColor1],
                           fadesOut: true,
                           radius: 500)
            
        }
        
    }
    
}

struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView(viewModel: DrawingViewModel())
    }
}
