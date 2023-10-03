//
//  DrawingViewModel.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 02/06/23.
//

import SwiftUI

class DrawingViewModel: ObservableObject {
    
    static let maxTime = 30
    @Published var currentTime = maxTime
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @Published var isTimeUp = false
    @Published var isLeaving = false
    @Published var isPaused = false
    @Published var isDisplayingAlert = false
    
    var scoreCounter = 0, hitsCounter = 0, currentDrawingIndex = 0
    var randomDrawings: [String] = []
    
    @Published var lines: [Line] = []
    @Published var drawing = Drawing()

    @Published var suggestion = "suggestion"
    @Published var feedback = "Draw your scribblium!"
    
    func pauseAction() {
        isDisplayingAlert.toggle()
        isPaused.toggle()
    }
    
    func unpauseAction() {
        pauseAction()
    }
        
    func decrementTimer() {
        
        if isDisplayingAlert {
            return
        }
        
        if currentTime == 0 {
            isDisplayingAlert.toggle()
            isTimeUp.toggle()
            timer.upstream.connect().cancel()
            return
        }
        
        currentTime -= 1
        
    }
    
    func backButtonAction() {
        isDisplayingAlert.toggle()
        isLeaving.toggle()
    }
    
    func deleteButtonAction() {
        clearDrawingCanvas()
        feedback = String(localized: "goScribblium")
    }
    
    func skipButtonAction() {
        clearDrawingCanvas()
        feedback = String(localized: "goScribblium")
        setupNextDrawing()
    }
    
    func onGestureChangedAction(value: DragGesture.Value) {

        let newPoint = value.location
        
        if value.translation.width + value.translation.height == 0 {
            lines.append(Line(points: [newPoint], color: Color.black, lineWidth: 5))
        } else {
            let index = lines.count - 1
            lines[index].points.append(newPoint)
        }

        drawing.add(point: value.location)

    }
    
    func onGestureEndedAction(value: DragGesture.Value) {
        
        drawing.endStroke()
        
        guard let prediction = DrawingPredictor.makePredictions(drawing: drawing).first else {
            print("error: undefined prediction")
            return
        }
        
        let classification = prediction.classification
        let confidence = prediction.confidence * 100
        
        print(classification, confidence)
        
        if classification == suggestion && confidence >= 40.0 { // a cleo reconhece que o jogador acertou o desenho

            hitsCounter += 1
            scoreCounter += DrawingViewModel.maxTime
//            navigationBond.setData(score)
                                            
            feedback = String(localized: "that's a \(NSLocalizedString(classification, comment: ""))")

            // delay de 1.5 sec
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.feedback = String(localized: "goScribblium")
            }

            HapticManager.instance.notification(type: .success)
            SoundManager.instance.playSound(sound: .correct)
            
            clearDrawingCanvas()
            setupNextDrawing()

        } else if confidence >= 25.0 { // a cleo tem uma noção do que o jogador desenhou
            feedback = String(localized: "kinda looks like a \(NSLocalizedString(classification, comment: "")) to me")
            HapticManager.instance.impact(style: .soft)
        } else { // a cleo não faz ideia do que o jogador desenhou
            feedback = String(localized: "iDontKnow")
        }
        
    }
    
}

extension DrawingViewModel { // Helpers
    
    private func clearDrawingCanvas() {
        lines = [Line]()
        drawing = Drawing()
    }
    
    private func setupNextDrawing() {
        currentDrawingIndex = (currentDrawingIndex + 1) % randomDrawings.count
        suggestion = randomDrawings[currentDrawingIndex]
    }
    
}
