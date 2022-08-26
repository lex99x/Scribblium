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
    
    @State var maxTime = 30
    @State var timerRunning = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timerIsPaused: Bool = true

    //var isLandscape: Bool { verticalSizeClass == .compact }
    
    @State private var drawing = [Line]()
    @State private var suggestion = DrawingModel.getRandomDrawing()
    @State private var feedback = ""
        
    @State private var prediction = ""
    @State private var predictionConfidence = 0
    @State private var showAlert = false
    @State private var alertMessage = ""
    private let drawingModel = DrawingModel()
    private let drawingPredictor = DrawingPredictor()
    
    @State private var disableButtons = false
    
    var body: some View {
        ZStack(alignment: .center){
            
            Color("DrawBackground")
                .ignoresSafeArea()
            Image("padraoPortrait")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            
//            if isLandscape {
//                HStack (alignment: .center, spacing: 54){
//
//                    VStack (alignment: .center){
//
//                        ZStack (alignment: .center){
//
//                            Image("MolduraLandscape")
//                                .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: 8, y: 7)
//
//                            Canvas { context, size in
//                                for line in drawing {
//                                    var path  = Path()
//                                    path.addLines(line.points)
//
//                                    context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
//
//                                }
//                            }
//                            .edgesIgnoringSafeArea(.all)
//                            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({ value in
//                                        let newPoint = value.location
//                                        if value.translation.width + value.translation.height == 0 {
//                                            drawing.append(Line(points: [newPoint], color: Color.black, lineWidth: 5))
//                                        } else {
//                                            let index = drawing.count - 1
//                                            drawing[index].points.append(newPoint)
//                                        }
//
//                                    })
//
//                            )
//                            .frame(width: 502.74, height: 272.84)
//                            //padrão em todos os modos
//                            .background(RoundedRectangle(cornerRadius: 31).inset(by: 3).foregroundColor(Color(UIColor(red: 1.00, green: 0.98, blue: 0.86, alpha: 1.00))))
//                            .background(Color("Contorno"))
//                            .cornerRadius(31)
//
//                            HStack (alignment: .center, spacing: 349.06){
//                                VStack (alignment: .center, spacing: 87.18) {
//                                    Image("fitinha portrait darkmode landscape 1")
//                                    Image("fitinha portrait darkmode landscape 2")
//                                }
//                                VStack (alignment: .center, spacing: 87.18) {
//                                    Image("fitinha portrait darkmode landscape 2")
//                                    Image("fitinha portrait darkmode landscape 1")
//                                }
//                            }
//                        }
//                        //.offset(x: 54, y: 32)
//
//                        Text(suggestion)
//                            .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
//                            .font(.custom("RubikMarkerHatch-Regular", size: 32))
//                            //.offset(x: 54)
//                    }
//
//                    VStack (alignment: .trailing, spacing: 129){
//                        Button(action: {
//                            drawing = [Line]()}) {
//                                ZStack{
//                                    Circle()
//                                        .frame(width: 83, height: 83)
//                                        .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
//                                        .overlay(
//                                            Circle()
//                                                .strokeBorder(Color("Contorno"), lineWidth: 3)
//                                            )
//                                    Image("lixeira fechada")
//                                }
//                            }
//                            //.offset(x: 29.06)
//
//                        Button(action: {
//                            suggestion = DrawModel.getRandomDrawing()
//                            drawing = [Line]()
//                        }) {
//                                ZStack{
//                                    Circle()
//                                        .frame(width: 83, height: 83)
//                                        .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
//                                        .overlay(
//                                            Circle()
//                                                .strokeBorder(Color("Contorno"), lineWidth: 3)
//                                            )
//                                    Image("enviar")
//                                }
//                            }
//                        //.offset(x: 29.06)
//
//                    }
//                }
//                .statusBar(hidden: true)
//            }
//
//            else {
            VStack (alignment: .center, spacing: 0.0){
                
                HStack(alignment: .center, spacing: 7) {
                    
                        Text(feedback)
                        .font(.custom("RubikMarkerHatch-Regular", size: 26))
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                    
                        ZStack(alignment: .center) {
                            
                            Circle()
                                .frame(width: 60, height: 60)
                                .foregroundColor(Color("TimerBackground"))
                                .overlay(
                                    Circle()
                                        .strokeBorder(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)), lineWidth: 3))
                            Text("\(maxTime)")
                                .onReceive(timer) { _ in
                                    if (maxTime > 0 && timerRunning) {
                                        maxTime -= 1
                                    }
                                    else if (maxTime == 0) {
                                        self.alertMessage = "Time's up!!!"
                                        self.showAlert = true
//                                        self.maxTime = 30
//                                        self.timerRunning = false
                                        timer.upstream.connect().cancel()
                                        self.disableButtons = true
                                    }
                                }
                                .font(.custom("RubikMarkerHatch-Regular", size: 21))
                                .foregroundColor(.white)
                        }
                    
                        ZStack(alignment: .center) {
                            Circle()
                                .frame(width: 60, height: 60)
                                .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                                .overlay(
                                    Circle()
                                        .strokeBorder(Color("Contorno"), lineWidth: 3))
                        }
                    
                        ZStack(alignment: .center) {
                            Circle()
                                .frame(width: 60, height: 60)
                                .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                                .overlay(
                                    Circle()
                                        .strokeBorder(Color("Contorno"), lineWidth: 3))
                        }
                        
                }
                ZStack(alignment: .center) {
                        
                    Image("MolduraCanvas")
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
                            
                            if !predictions.isEmpty {
                                self.prediction = predictions.first!.classification
                                self.predictionConfidence = Int(predictions.first!.confidence * 100)
                                feedback = "Is it a " + self.prediction + "?"
                            }
                        })
                    ).disabled(disableButtons)
                    .frame(width: 318, height: 482.51)
                    .background(RoundedRectangle(cornerRadius: 31).inset(by: 3).foregroundColor(Color(UIColor(red: 1.00, green: 0.98, blue: 0.86, alpha: 1.00))))
                    .background(Color("Contorno"))
                    //padrão em todos os modos
                    .cornerRadius(31)


                    VStack(alignment: .center, spacing: 317.06) {
                        
                        HStack(alignment: .center, spacing: 152.18) {
                            Image("Fitinha 1 Portrait darkmode")
                            Image("Fitinha 2 Portrait darkmode")
                        }
                        HStack(alignment: .center, spacing: 152.18) {
                            Image("Fitinha 2 Portrait darkmode")
                            Image("Fitinha 1 Portrait darkmode")
                        }
                    }
                }
                    
                Text(suggestion)
                    .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                    .font(.custom("RubikMarkerHatch-Regular", size: 32))
                
                HStack(alignment: .bottom, spacing: 172) {
                    Button(action: {
                        drawing = [Line]()
                        drawingModel.drawing = []
                        feedback = ""
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
                    }.disabled(disableButtons)
                    Button(action: {
                        if(!drawing.isEmpty){
//                            suggestion = DrawingModel.getRandomDrawing()
                            
                            if self.prediction == self.suggestion {
                                self.alertMessage = "Congratulations, that's " + String(predictionConfidence) + "% a " + suggestion + "!"
                                self.showAlert = true
//                                timer.upstream.connect().cancel()
                                self.timerRunning = false
                                self.maxTime = 30
                                feedback = ""
                                drawing = [Line]()
                                suggestion = DrawingModel.getRandomDrawing()
                                
                            } else {
                                self.alertMessage = "Oops, that's not a " + suggestion + " :("
                                self.showAlert = true
                            }
                            
                        } else {
                            print("Desenho vazio!")
                            self.alertMessage = "You can't proceed with an empty drawing!"
                            self.showAlert = true
                        }
                        //drawing = [Line]()
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
                    }.disabled(disableButtons)
                    }
            }
            .statusBar(hidden: true)
        }
        .alert(alertMessage, isPresented: $showAlert) {
            Button("Ok", role: .cancel) {
                self.timerRunning = true
            }
        }
        
    }
}

struct DrawView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DrawView()
                .previewInterfaceOrientation(.portrait)
//            DrawView()
//                .previewInterfaceOrientation(.landscapeRight)
        }
    }
}
