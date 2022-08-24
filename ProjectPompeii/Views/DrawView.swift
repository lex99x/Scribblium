//
//  DrawView.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 17/08/22.
//

import SwiftUI

struct DrawView: View {
    
    @Environment (\.verticalSizeClass) var verticalSizeClass
    @Environment (\.horizontalSizeClass) var horizontalSizeClass
    
    var isLandscape: Bool { verticalSizeClass == .compact }
    
    @State private var drawing = [Line]()
    @State private var suggestion = DrawModel.getRandomDrawing()
    
    var body: some View {
        ZStack(alignment: .center){
            
            Color("DrawBackground")
                .ignoresSafeArea()
            Image("padraoPortrait")
                .resizable()
                .ignoresSafeArea()
                //.scaledToFill()
            
            if isLandscape {
                HStack (alignment: .center, spacing: 54){
                    VStack (alignment: .center){
                        ZStack (alignment: .center){
                            Image("MolduraLandscape")
                                .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: 8, y: 7)
                            Canvas { context, size in
                                for line in drawing {
                                    var path  = Path()
                                    path.addLines(line.points)
                                    
                                    context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)

                                }
                            }
                            .edgesIgnoringSafeArea(.all)
                            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({ value in
                                        let newPoint = value.location
                                        if value.translation.width + value.translation.height == 0 {
                                            drawing.append(Line(points: [newPoint], color: Color.black, lineWidth: 5))
                                        } else {
                                            let index = drawing.count - 1
                                            drawing[index].points.append(newPoint)
                                        }
                                        
                                    })
                                    
                                    )
                            //.frame(width: 502.74, height: 272.84)
                            .frame(width: UIScreen.main.bounds.width/1.7, height: UIScreen.main.bounds.height/1.45)
                            //padrão em todos os modos
                            .background(RoundedRectangle(cornerRadius: 31).inset(by: 3).foregroundColor(Color(UIColor(red: 1.00, green: 0.98, blue: 0.86, alpha: 1.00))))
                            .background(Color("Contorno"))
                            .cornerRadius(31)

                            HStack (alignment: .center, spacing: 349.06){
                                VStack (alignment: .center, spacing: 87.18) {
                                    Image("fitinha portrait darkmode landscape 1")
                                    Image("fitinha portrait darkmode landscape 2")
                                }
                                VStack (alignment: .center, spacing: 87.18) {
                                    Image("fitinha portrait darkmode landscape 2")
                                    Image("fitinha portrait darkmode landscape 1")
                                }
//                                Image("Fitinhas esquerdas")
//                                    .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: -4, y: 6)
//                                Image("Fitinhas Direitas")
//                                    .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: -4, y: 6)
                            }
                        }
                        .offset(x: 54, y: 32)

                                            
                        Text(suggestion)
                            .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                            .font(.custom("RubikMarkerHatch-Regular", size: 32))
                            .offset(x: 54)
                    }
                    VStack (alignment: .trailing, spacing: 129){
                        Button(action: {
                            drawing = [Line]()}) {
                                ZStack{
                                    Circle()
                                        .frame(width: 83, height: 83)
                                        .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                                        .overlay(
                                            Circle()
                                                .strokeBorder(Color("Contorno"), lineWidth: 3)
                                            )
                                    Image("lixeira fechada")
                                }
                            }
                            //.offset(x: 29.06)
                        
                        Button(action: {
                            suggestion = DrawModel.getRandomDrawing()
                            drawing = [Line]()
                        }) {
                                ZStack{
                                    Circle()
                                        .frame(width: 83, height: 83)
                                        .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                                        .overlay(
                                            Circle()
                                                .strokeBorder(Color("Contorno"), lineWidth: 3)
                                            )
                                    Image("enviar")
                                }
                            }
                        //.offset(x: 29.06)

                    }
                }
                .statusBar(hidden: true)
            }
             
            else {
                VStack (alignment: .center){/*
                    HStack {
                        Button(action: {
                            }) {
                                Circle()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(Color(UIColor(red: 0.14, green: 0.11, blue: 0.23, alpha: 1.00)))
                                    .overlay(Capsule().inset(by: 3).foregroundColor(Color(UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00))))
                                    //.border(Color(UIColor(red: 0.14, green: 0.11, blue: 0.23, alpha: 1.00)), width: 3)
                            }
                    }
                    */
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
                        .edgesIgnoringSafeArea(.all)
                        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({ value in
                                    let newPoint = value.location
                                    if value.translation.width + value.translation.height == 0 {
                                        drawing.append(Line(points: [newPoint], color: Color.black, lineWidth: 5))
                                    } else {
                                        let index = drawing.count - 1
                                        drawing[index].points.append(newPoint)
                                    }
                                    
                                })
                                
                                )
                        .frame(width: UIScreen.main.bounds.width/1.2, height: UIScreen.main.bounds.height/1.75)
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
                            
//                            Image("Fitinhas de baixo")
//                                .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: -4, y: 6)
                        }

                    }
                    .offset(y: 35)
                    
                    Text(suggestion)
                        .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                        .font(.custom("RubikMarkerHatch-Regular", size: 32))
                                
                    HStack(alignment: .bottom, spacing: 172) {
                        Button(action: {
                            drawing = [Line]()}) {
                                ZStack{
                                    Circle()
                                        .frame(width: 83, height: 83)
                                        .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                                        .overlay(
                                            Circle()
                                                .strokeBorder(Color("Contorno"), lineWidth: 3))
                                    Image("lixeira fechada")
                                }
                            }
                        Button(action: {
                            suggestion = DrawModel.getRandomDrawing()
                            drawing = [Line]()
                        }) {
                                ZStack{
                                    Circle()
                                        .frame(width: 83, height: 83)
                                        .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                                        .overlay(
                                            Circle()
                                                .strokeBorder(Color("Contorno"), lineWidth: 3)
                                            )
                                    Image("enviar")
                                }
                        }
                    }
                }
                .statusBar(hidden: true)
            }
        }
        
    }
}

struct DrawView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DrawView()
                .previewInterfaceOrientation(.portrait)
            DrawView()
                .previewInterfaceOrientation(.landscapeRight)
        }
    }
}
