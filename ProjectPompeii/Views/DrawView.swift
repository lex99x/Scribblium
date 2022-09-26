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
    @State var leave = false
    @State var pause = false
    @State var maxTime = 2
    @State var timerRunning = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timerIsPaused: Bool = true
    
    //var isLandscape: Bool { verticalSizeClass == .compact }
    
    @State private var drawing = [Line]()
//    private let randomDrawings = DrawingModel.getRandomDrawings()
    @State private var randomDrawings: [String] = []
    @State private var currentDrawingIndex = 0
    @State private var suggestion = ""
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
                                .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                        }
                        .padding([.leading], 13)
                        .disabled(isShowingAlert)
                        
                        ZStack {
                            
                            Circle()
                                .frame(maxWidth: 62, maxHeight: 62)
                            //.scaledToFill()
                                .foregroundColor(Color("TimerBackground"))
                                .overlay(
                                    Circle()
                                        .strokeBorder(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)), lineWidth: 3))
                            
                            Text("\(maxTime)")
                                .font(.custom("Rubik-Black", size: 32))
                                .frame(maxWidth: 38, maxHeight: 31)
                                .minimumScaleFactor(0.1)
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
                        
                        Spacer()
                        
                        Button {
                            
                            isShowingAlert = true
                            pause = true
                            timerRunning = false
                            
                        } label: {
                            ZStack {
                                
                                Circle()
                                    .frame(maxWidth: 62, maxHeight: 62)
                                //.scaledToFill()
                                    .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                                    .overlay(
                                        Circle()
                                            .strokeBorder(Color("Contorno"), lineWidth: 3))
                                
                                Image(systemName: "pause.fill")
                                    .resizable()
                                    .frame(maxWidth: 19, maxHeight: 25)
                                    .foregroundColor(Color("TertiaryColor-1"))
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
                        .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                    //.padding([.leading], 26)
                }
                .padding([.top], 59)
                
                ZStack() {
                    
                    RoundedRectangle(cornerRadius: 31)
                        .frame(maxWidth: 338, maxHeight: 501)
                        .scaledToFill()
                        .foregroundColor(Color("SecondaryColor-1"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 31)
                                .strokeBorder(Color("Contorno"), lineWidth: 3)
                        )
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
                    .scaledToFill()
                    .background(RoundedRectangle(cornerRadius: 31).inset(by: 3).foregroundColor(Color(UIColor(red: 1.00, green: 0.98, blue: 0.86, alpha: 1.00))))
                    .background(Color("Contorno"))
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
                                    
                                    score += maxTime
                                    navigationBond.setData(score)
                                    
                                    feedback = "That's a " + self.prediction + "!"
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                        feedback = "Go scribblium!"
                                    }
                                
                                    drawing = [Line]()
                                    drawingModel.drawing = []
                                    
                                    currentDrawingIndex = (currentDrawingIndex + 1) % randomDrawings.count
                                    suggestion = randomDrawings[currentDrawingIndex]
                                    
                                }
                            }
                        })
                    )
                    .disabled(isShowingAlert)
                    
                    VStack (){
                        
                        HStack (){
                            Image("Fitinha 1 Portrait darkmode")
                                //.resizable()
//                                .frame(maxWidth: 113.82, maxHeight: 110.94)
//                                .scaledToFill()
                            Spacer()
                            Image("Fitinha 2 Portrait darkmode")
                                //.resizable()
//                                .frame(maxWidth: 113.82, maxHeight: 110.94)
//                                .scaledToFill()
                        }
                        .padding([.horizontal], 5)
                        .padding([.vertical], -27.24)
                        
                        Spacer()
                        
                        HStack (){
                            Image("Fitinha 2 Portrait darkmode")
                                //.resizable()
//                                .frame(maxWidth: 113.82, maxHeight: 110.94)
//                                .scaledToFill()
                            Spacer()
                            Image("Fitinha 1 Portrait darkmode")
                                //.resizable()
//                                .frame(maxWidth: 113.82, maxHeight: 110.94)
//                                .scaledToFill()
                        }
                        .padding([.horizontal], 5)
                        .padding([.vertical], -27.24)
                    }
//                    .padding([.horizontal], 5)
//                    .padding([.vertical], -27.24)
                }
                .padding([.top], 9)
                
                Text(suggestion)
                    .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                    .font(.custom("Rubik-Black", size: 32))
                    .frame(maxWidth: 148, maxHeight: 36)
                    .minimumScaleFactor(0.1)
                    .scaledToFill()
                
                HStack() {
                    
                    VStack {
                        Button(action: {
                            drawing = [Line]()
                            drawingModel.drawing = []
                            feedback = "Go scribblium!"
                        }) {
                            ZStack {
                                Circle()
                                    .frame(maxWidth: 62, maxHeight: 62)
                                    //.scaledToFill()
                                    .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                                    .overlay(
                                        Circle()
                                            .strokeBorder(Color("Contorno"), lineWidth: 3))
                                Image(systemName: "trash.fill")
                                    .resizable()
                                    .frame(maxWidth: 22, maxHeight: 24)
                                    .foregroundColor(Color("TertiaryColor-1"))
                                    //.scaledToFill()
                            }
                        }
                        .disabled(isShowingAlert)
                        Text("delete")
                            .foregroundColor(.white)
                            .font(.custom("Rubik-Regular", size: 14))
                            .frame(maxWidth: 41, maxHeight: 21)
                            .minimumScaleFactor(0.1)
                            //.scaledToFill()
                            .multilineTextAlignment(.center)
                    }
                    .padding([.leading], 25)
                    .padding([.bottom], 35)
                    
                    Spacer()
                    
                    VStack {
                        Button(action: {
                            
//                            if(!drawing.isEmpty){
//                                if self.prediction == self.suggestion {
//                                    feedback = "Go scribblium!"
//                                    drawing = [Line]()
//                                    suggestion = DrawingModel.getRandomDrawing()
//
//                                    score += maxTime
//                                    navigationBond.setData(score)
//
//                                } else {
////                                    self.showAlert = true
//                                    isShowingAlert = true
//                                    confirme = true
//                                }
//
//                            } else {
//                                print("Desenho vazio!")
//                                isShowingAlert = true
//                                empty = true
//                            }
                            
                            feedback = "Go scribblium!"
                            
                            drawing = [Line]()
                            drawingModel.drawing = []
                            
                            currentDrawingIndex = (currentDrawingIndex + 1) % randomDrawings.count
                            suggestion = randomDrawings[currentDrawingIndex]
                                                        
                        }) {
                            ZStack(alignment: .center){
                                Circle()
                                    .frame(maxWidth: 62, maxHeight: 62)
                                    //.scaledToFill()
                                    .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                                    .overlay(
                                        Circle()
                                            .strokeBorder(Color("Contorno"), lineWidth: 3)
                                    )
                                Image(systemName: "forward.end.fill")
                                    .resizable()
                                    .frame(maxWidth: 22, maxHeight: 18.84)
                                    .foregroundColor(Color("TertiaryColor-1"))
                                    //.scaledToFill()
                            }
                        }.disabled(isShowingAlert)
                        
                        Text("skip")
                            .foregroundColor(.white)
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
        .onAppear() {
            navigationBond.setData(0)
            randomDrawings = DrawingModel.getRandomDrawings()
            suggestion = randomDrawings[currentDrawingIndex]
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color("DrawBackground")
                .ignoresSafeArea()
            Image("padraoPortrait")
                .resizable(resizingMode: .tile)
                .scaledToFill()
                .ignoresSafeArea()
        }
//        .alert(alertMessage, isPresented: $showAlert) {
//            Button("Ok", role: .cancel) {
//                self.timerRunning = true
//            }
//        }
        
    }
}

struct DrawView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DrawView(navigationBond: .constant(NavigationBond(destination: .cleo)))
                .previewInterfaceOrientation(.portrait)
        }
    }
}
