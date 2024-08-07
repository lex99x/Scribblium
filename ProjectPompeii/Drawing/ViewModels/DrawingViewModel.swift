//
//  DrawingViewModel.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 02/06/23.
//

import Combine
import SwiftUI

class DrawingViewModel: ObservableObject {
    
    @Published var currentTiming: Int = 30
    @Published var lines: [Line] = []
    @Published var suggestion: String
    @Published var feedback = String(localized: "goScribblium")
    @Published var displayedAlert: CustomAlertType? = .none
        
    var drawing = Drawing()
    var scoreCounter: Int = .zero
    var successCounter: Int = .zero
    var currentDrawingIndex: Int = .zero
    var randomSuggestions: [String]
    
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var isTimerTicking = true

    init() {
        randomSuggestions = Drawing.getShuffledDrawings()
        suggestion = randomSuggestions.first ?? "nil"
    }
    
    func reset() {
        
        guard !isTimerTicking else { // prossiga se timer e demais atributos precisam ser resetados senão retorne
            return
        }
                
        restartTimer()
        resetDrawingCanvas()
        
        currentTiming = 30
        scoreCounter = .zero
        successCounter = .zero
        currentDrawingIndex = .zero
        
        randomSuggestions = Drawing.getShuffledDrawings()
        suggestion = randomSuggestions[currentDrawingIndex]
        feedback = String(localized: "goScribblium")
        displayedAlert = .none
        
    }
    
}

extension DrawingViewModel { // MARK: Timer Methods
    
    func cancelTimer() {
        timer.upstream.connect().cancel()
        isTimerTicking = false
    }
    
    func restartTimer() {
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        isTimerTicking = true
    }
    
    func decrementTiming() {
        
        guard displayedAlert == .none else { // prossiga se displayedAlert for .none senão retorne
            return
        }
        
        guard currentTiming != 0 else { // prossiga se currentTiming for diferente de zero senão ... e retorne
            displayedAlert = .timesUp
            return
        }
        
        currentTiming -= 1
        
    }
    
}

extension DrawingViewModel { // MARK: User Actions
        
    func pauseAction() {
        displayedAlert = .pausing
    }
    
    func unpauseAction() {
        displayedAlert = .none
    }
    
    func backButtonAction() {
        displayedAlert = .leaving
    }
    
    func deleteButtonAction() {
        resetDrawingCanvas()
        feedback = String(localized: "goScribblium")
    }
    
    func skipButtonAction() {
        resetDrawingCanvas()
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

            successCounter += 1
            scoreCounter += currentTiming
                                            
            feedback = String(localized: "thats a \(NSLocalizedString(classification, comment: ""))")

            // delay de 1.5 sec
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.feedback = String(localized: "goScribblium")
            }

            HapticsHelper.instance.notification(type: .success)
            SoundHelper.instance.playSound(sound: .correct)
            
            resetDrawingCanvas()
            setupNextDrawing()

        } else if confidence >= 25.0 { // a cleo tem uma noção do que o jogador desenhou
            
            feedback = String(localized: "kinda looks like a \(NSLocalizedString(classification, comment: "")) to me")
            HapticsHelper.instance.impact(style: .soft)
            
        } else { // a cleo não faz ideia do que o jogador desenhou
            feedback = String(localized: "iDontKnow")
        }
        
    }
    
}

extension DrawingViewModel { // MARK: Helpers
    
    private func resetDrawingCanvas() {
        lines = []
        drawing = Drawing()
    }
    
    private func setupNextDrawing() {
        currentDrawingIndex = (currentDrawingIndex + 1) % randomSuggestions.count
        suggestion = randomSuggestions[currentDrawingIndex]
    }
    
}
