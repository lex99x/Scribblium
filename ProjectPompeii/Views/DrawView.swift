//
//  DrawView.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 17/08/22.
//

import SwiftUI

struct DrawView: View {
    
    //    @Environment (\.verticalSizeClass) var verticalSizeClass
    //    @Environment (\.horizontalSizeClass) var horizontalSizeClass
    
    @Binding var navigationBond: NavigationBond
    
    @State var timeup = false
    @State var confirme = false
    @State var empty = false
    @State var maxTime = 30
    @State var timerRunning = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timerIsPaused: Bool = true
    
    //var isLandscape: Bool { verticalSizeClass == .compact }
    
    @State private var drawing = [Line]()
    @State private var suggestion = DrawingModel.getRandomDrawing()
    @State private var feedback = "Go scribblium!"
    
    @State private var prediction = ""
    @State private var predictionConfidence = 0
//    @State private var showAlert = false
    @State private var alertMessage = ""
    private let drawingModel = DrawingModel()
    private let drawingPredictor = DrawingPredictor()
    
    @State private var disableButtons = false
    @State private var isShowingAlert = false
    
    @State var score = 0
    
    var body: some View {
        
        ZStack {
            
            VStack (spacing: 0.0){
                
                HStack {
                    
                    Text(feedback)
                        .font(.custom("Rubik-Black", size: 26))
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                        .frame(width: 217, height: 43)
                    
                    ZStack {
                        
                        Circle()
                            .frame(width: 83, height: 83)
                            .foregroundColor(Color("TimerBackground"))
                            .overlay(
                                Circle()
                                    .strokeBorder(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)), lineWidth: 3))
                        
                        Text("\(maxTime)")
                            .font(.custom("Rubik-Black", size: 32))
                            .foregroundColor(.white)
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
                    .padding([.bottom], 9)
                    
                }
                ZStack(alignment: .center) {
                    
                    Image("MolduraCanvas")
                        .resizable()
                        .frame(width: 338, height: 501)
                        .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: 8, y: 7)
                    
                    Canvas { context, size in
                        for line in drawing {
                            var path  = Path()
                            path.addLines(line.points)
                            
                            context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                            
                        }
                    }
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
                            let predictions = drawingPredictor.makePredictions(drawing: drawingModel)
                            
                            for prediction in predictions {
                                print(prediction.classification, String(prediction.confidence * 100) + " %")
                            }
                            print("\n")
                            
                            if !predictions.isEmpty {
                                self.prediction = predictions.first!.classification
                                
                                if self.prediction != suggestion {
                                    feedback = "That looks like a " + self.prediction
                                }
                                else {
                                    feedback = "That's a " + self.prediction + "!"
                                }
                            }
                        })
                    ).disabled(isShowingAlert)
                        .frame(width: 318, height: 482.51)
                        .background(RoundedRectangle(cornerRadius: 31).inset(by: 3).foregroundColor(Color(UIColor(red: 1.00, green: 0.98, blue: 0.86, alpha: 1.00))))
                        .background(Color("Contorno"))
                    //padrão em todos os modos
                        .cornerRadius(31)
                    
                    VStack (spacing: 317.06){
                        
                        HStack (spacing: 152.18){
                            Image("Fitinha 1 Portrait darkmode")
                            Image("Fitinha 2 Portrait darkmode")
                        }
                        HStack (spacing: 152.18){
                            Image("Fitinha 2 Portrait darkmode")
                            Image("Fitinha 1 Portrait darkmode")
                        }
                    }
                }
                
                Text(suggestion)
                    .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                    .font(.custom("Rubik-Black", size: 32))
                
                HStack(spacing: 142) {
                    
                    VStack {
                        Button(action: {
                            drawing = [Line]()
                            drawingModel.drawing = []
                            feedback = "Go scribblium!"
                        }) {
                            ZStack {
                                Circle()
                                    .frame(width: 83, height: 83)
                                    .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                                    .overlay(
                                        Circle()
                                            .strokeBorder(Color("Contorno"), lineWidth: 3))
                                Image("lixeira fechada")
                            }
                        }.disabled(isShowingAlert)
                        Text("delete")
                            .foregroundColor(.white)
                            .font(.custom("Rubik-Regular", size: 14))
                            .multilineTextAlignment(.center)
                    }
                    
                    VStack {
                        Button(action: {
                            if(!drawing.isEmpty){
                                if self.prediction == self.suggestion {
                                    feedback = ""
                                    drawing = [Line]()
                                    suggestion = DrawingModel.getRandomDrawing()
                                    
                                    score += maxTime
                                    navigationBond.setData(score)
                                   
                                } else {
//                                    self.showAlert = true
                                    isShowingAlert = true
                                    confirme = true
                                }
                                
                            } else {
                                print("Desenho vazio!")
                                isShowingAlert = true
                                empty = true
                            }
                        }) {
                            ZStack(alignment: .center){
                                Circle()
                                    .frame(width: 83, height: 83)
                                    .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                                    .overlay(
                                        Circle()
                                            .strokeBorder(Color("Contorno"), lineWidth: 3)
                                    )
                                Image("enviar")
                            }
                        }.disabled(isShowingAlert)
                        
                        Text("submit")
                            .foregroundColor(.white)
                            .font(.custom("Rubik-Regular", size: 14))
                            .multilineTextAlignment(.center)
                    }
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
            
        }
        .onAppear() {
            navigationBond.setData(0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color("DrawBackground")
                .ignoresSafeArea()
            Image("padraoPortrait")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
        }
//        .alert(alertMessage, isPresented: $showAlert) {
//            Button("Ok", role: .cancel) {
//                self.timerRunning = true
//            }
//        }
        
    }
}

//struct DrawView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            DrawView()
//                .previewInterfaceOrientation(.portrait)
//
//        }
//    }
//}
