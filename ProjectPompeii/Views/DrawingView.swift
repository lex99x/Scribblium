//
//  DrawingView.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 17/08/22.
//

import SwiftUI
import ConfettiSwiftUI

struct DrawingView: View {
    
    @Binding var navigationBond: NavigationBond
    
    @State var timeup = false
    @State var confirme = false
    @State var empty = false
    @State var leave = false
    @State var pause = false
    @State var timerRunning = true
    @State private var disableButtons = false
    @State private var isShowingAlert = false
    
    @State var maxTime = 30
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timerIsPaused: Bool = true
    
    @State private var drawing = [Line]()
    @State private var randomDrawings: [String] = []
    @State private var currentDrawingIndex = 0
    @State private var suggestion = ""
    @State private var feedback = ""
    @State private var alertMessage = ""
    
    @State private var drawingModel = Drawing()
    private let drawingPredictor = DrawingPredictor()
    
    @State var score = 0
    @State private var counter = 0
        
    var body: some View {
        
        ZStack {
            VStack {
                VStack {
                    HStack {
                        
                        Button {
                            
                            timerRunning = false
                            isShowingAlert = true
                            leave = true
                            
                        } label: {
                            Image(systemName: "chevron.left")
                                .resizable()
                                .frame(maxWidth: 18, maxHeight: 24)
                                .foregroundColor(.tertiaryColor1)
                        }
                        .padding([.leading], 13)
                        .disabled(isShowingAlert)
                        
                        ZStack {
                            
                            Circle()
                                .frame(maxWidth: 62, maxHeight: 62)
//                                .scaledToFill()
                                .foregroundColor(.backgroundTimer)
                                .overlay(
                                    Circle()
                                        .strokeBorder(Color.secondaryColor1, lineWidth: 3))
                            
                            Text("\(maxTime)")
                                .font(.custom("Rubik-Black", size: 32))
                                .frame(maxWidth: 38, maxHeight: 31)
                                .minimumScaleFactor(0.1)
                                .foregroundColor(.textPaper)
                                .onReceive(timer) { _ in
                                    if (maxTime > 0 && timerRunning) {
                                        maxTime -= 1
                                    }
                                    else if (maxTime == 0) {
                                        isShowingAlert = true
                                        timeup = true
                                        timer.upstream.connect().cancel()
                                        self.disableButtons = true
                                    }
                                }
                        }
                        
                        Spacer()
                        
                        Button {
                            
                            isShowingAlert = true
                            pause = true
                            timerRunning = false
                            
                        } label: {
                            ZStack {
                                
                                Circle()
                                    .frame(maxWidth: 62, maxHeight: 62)
//                                    .scaledToFill()
                                    .foregroundColor(.secondaryColor1)
                                    .overlay(
                                        Circle()
                                            .strokeBorder(Color.contorno, lineWidth: 3))
                                
                                Image(systemName: "pause.fill")
                                    .resizable()
                                    .frame(maxWidth: 19, maxHeight: 25)
                                    .foregroundColor(.tertiaryColor1)
                            }
                        }
                        .padding([.trailing], 25)
                        .disabled(isShowingAlert)
                        
                    }
                    
                    Text(feedback)
                        .font(.custom("Rubik-Black", size: 20))
                        .frame(maxHeight: 24)
                        .minimumScaleFactor(0.1)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.secondaryColor1)
//                        .padding([.leading], 26)
                        .padding([.bottom], 10)
                        .frame(maxWidth: 318)
                }
                .padding([.top], 59)
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 31)
                        .frame(maxWidth: 338, maxHeight: 501)
//                        .frame(maxWidth: 370.93, maxHeight: 549.38)
                        .scaledToFill()
                        .foregroundColor(.secondaryColor1)
                        .overlay(
                            RoundedRectangle(cornerRadius: 31)
                                .strokeBorder(Color.contorno, lineWidth: 3))
                        // sombra especifica
                        .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: 8, y: 7)
                        .padding([.vertical], -10)
                    
                    Canvas { context, size in
                        for line in drawing {
                            var path  = Path()
                            path.addLines(line.points)
                            context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                        }
                    }
                    .frame(maxWidth: 318, maxHeight: 482.51)
//                    .frame(maxWidth: 348.98, maxHeight: 529.38)
                    .scaledToFill()
                    .background(RoundedRectangle(cornerRadius: 31).inset(by: 3).foregroundColor(.textPaper))
                    .background(Color.contorno)
                    .cornerRadius(31)
                    .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({ value in
                        
                        let newPoint = value.location
                        if value.translation.width + value.translation.height == 0 {
                            drawing.append(Line(points: [newPoint], color: Color.black, lineWidth: 5))
                        } else {
                            let index = drawing.count - 1
                            drawing[index].points.append(newPoint)
                        }
                        
                        drawingModel.add(point: value.location)
                        
                    })
                        .onEnded({ value in
                            
                            drawingModel.endStroke()
//                            drawingModel.logDrawing()
                            
                            let predictions = drawingPredictor.makePredictions(drawing: drawingModel)
                            let prediction = predictions.first!
                            
                            let classification = prediction.classification
                            let confidence = prediction.confidence * 100
                            
                            print(classification, confidence)
                            
                            if classification == suggestion && confidence >= 40.0 { // a cleo reconhece que o jogador acertou o desenho
                                
                                counter += 1
                                score += maxTime
                                navigationBond.setData(score)
                                
//                                ScoreManager.logScore(maxTime: maxTime, score: score)
                                
                                feedback = "That's " + Drawing.formatPrediction(prediction: classification) + "!"
                                
                                // delay de 1.5 sec
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                    feedback = "Go scribblium!"
                                }
                            
                                HapticManager.instance.notification(type: .success)
                                SoundManager.instance.playSound(sound: .correct)
                                
                                drawing = [Line]()
                                drawingModel = Drawing()
                                
                                currentDrawingIndex = (currentDrawingIndex + 1) % randomDrawings.count
                                suggestion = randomDrawings[currentDrawingIndex]
                                
                            } else if confidence >= 25.0 { // a cleo tem uma noção do que o jogador desenhou
                                
                                feedback = "Kinda looks like " + Drawing.formatPrediction(prediction: classification) + " to me"
                                
                                HapticManager.instance.impact(style: .soft)
                                
                            } else { // a cleo não faz ideia do que o jogador desenhou
                                feedback = "I don't know what that is"
                            }
                            
                        })
                    )
                    .disabled(isShowingAlert)
                    
                    VStack {
                        
                        HStack {
                            Image("Fitinha 1 Portrait darkmode")
                            Spacer()
                            Image("Fitinha 2 Portrait darkmode")
                        }
                        .padding([.horizontal], 5)
                        .padding([.vertical], -27.24)
                        
                        Spacer()
                        
                        HStack {
                            Image("Fitinha 2 Portrait darkmode")
                            Spacer()
                            Image("Fitinha 1 Portrait darkmode")
                        }
                        .padding([.horizontal], 5)
                        .padding([.vertical], -27.24)
                    }
//                    .padding([.horizontal], 5)
//                    .padding([.vertical], -27.24)
                    
                    ConfettiCannon(counter: $counter, num: 13, colors: [Color.tertiaryColor1, Color.primaryColor1, Color.secondaryColor1], fadesOut: true, radius: 500)
                    
                }
                .padding([.top], 9)
                
                Text(suggestion)
                        .foregroundColor(.secondaryColor1)
                    .font(.custom("Rubik-Black", size: 32))
                    .frame(maxWidth: 148, maxHeight: 36)
                    .minimumScaleFactor(0.1)
                    .scaledToFill()
                    .padding([.top], 10)
                
                HStack {
                    
                    VStack {
                        Button(action: {
                            
                            drawing = [Line]()
                            drawingModel = Drawing()
                            
                            feedback = "Go scribblium!"
                            
                            
                        }) {
                            ZStack {
                                Circle()
                                    .frame(maxWidth: 62, maxHeight: 62)
//                                    .scaledToFill()
                                    .foregroundColor(.secondaryColor1)
                                    .overlay(
                                        Circle()
                                            .strokeBorder(Color.contorno, lineWidth: 3))
                                Image(systemName: "trash.fill")
                                    .resizable()
                                    .frame(maxWidth: 22, maxHeight: 24)
                                    .foregroundColor(.tertiaryColor1)
//                                    .scaledToFill()
                            }
                        }
                        .disabled(isShowingAlert)
                        Text("delete")
                            .foregroundColor(.textPaper)
                            .font(.custom("Rubik-Regular", size: 14))
                            .frame(maxWidth: 41, maxHeight: 21)
                            .minimumScaleFactor(0.1)
//                            .scaledToFill()
                            .multilineTextAlignment(.center)
                    }
                    .padding([.leading], 25)
                    .padding([.bottom], 35)
                    
                    Spacer()
                    
                    VStack {
                        Button(action: {
                            
                            drawing = [Line]()
                            drawingModel = Drawing()
                            
                            feedback = "Go scribblium!"
                            
                            currentDrawingIndex = (currentDrawingIndex + 1) % randomDrawings.count
                            suggestion = randomDrawings[currentDrawingIndex]
                            
                        }) {
                            ZStack(alignment: .center){
                                Circle()
                                    .frame(maxWidth: 62, maxHeight: 62)
//                                    .scaledToFill()
                                    .foregroundColor(.secondaryColor1)
                                    .overlay(
                                        Circle()
                                            .strokeBorder(Color.contorno, lineWidth: 3))
                                Image(systemName: "forward.end.fill")
                                    .resizable()
                                    .frame(maxWidth: 22, maxHeight: 18.84)
                                    .foregroundColor(.tertiaryColor1)
//                                    .scaledToFill()
                            }
                        }
                        .disabled(isShowingAlert)
//                        .confettiCannon(counter: $counter, radius: 500)
                        
                        Text("skip")
                            .foregroundColor(.textPaper)
                            .font(.custom("Rubik-Regular", size: 14))
                            .frame(maxWidth: 30, maxHeight: 21)
                            .minimumScaleFactor(0.1)
                            .multilineTextAlignment(.center)
                    }
                    .padding([.trailing], 25)
                    .padding([.bottom], 35)
                }
            }
            .statusBar(hidden: true)
            
            if timeup {
                CustomAlertTimesUp(shown: $timeup, navigationBond: $navigationBond, isShowingAlert: $isShowingAlert)
            }
            if confirme {
                CustomAlertOops(shown: $confirme, isShowingAlert: $isShowingAlert)
            }
            if empty {
                CustomAlertEmpty(shown: $empty, isShowingAlert: $isShowingAlert)
            }
            if leave {
                CustomLeaveDrawView(shown: $leave, navigationBond: $navigationBond, isShowingAlert: $isShowingAlert, timerRunning: $timerRunning)
            }
            if pause {
                CustomPaused(shown: $pause, isShowingAlert: $isShowingAlert, timerRunning: $timerRunning)
            }
            
        }
        .onAppear() { // inicilizando variáveis ao construir a tela
            navigationBond.setData(score)
            feedback = "Go scribblium!"
            randomDrawings = Drawing.getShuffledDrawings()
            suggestion = randomDrawings[currentDrawingIndex]
        }
        .onChange(of: timeup, perform: { value in
            if value {
                Task {
                    await GameCenterManager.updateLeaderboard(score: score)
                }
            }
        })
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.backgroundDrawView
                .ignoresSafeArea()
            Image("padraoPortrait")
                .resizable(resizingMode: .tile)
                .scaledToFill()
                .ignoresSafeArea()
        }

    }
    
}

struct DrawView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DrawingView(navigationBond: .constant(NavigationBond(destination: .cleo, data: true)))
                .previewInterfaceOrientation(.portrait)
        }
    }
}
