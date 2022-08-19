//
//  DrawView.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 17/08/22.
//

import SwiftUI

struct DrawView: View {
    
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
                    .frame(width: 318, height: 482.51)
                    
                    .background(RoundedRectangle(cornerRadius: 31).inset(by: 3).foregroundColor(Color(UIColor(red: 1.00, green: 0.98, blue: 0.86, alpha: 1.00))))
                    .background(Color("Contorno"))
                    //padrão em todos os modos
                    .cornerRadius(31)
                    

                    VStack(alignment: .center, spacing: 317.06) {
                        Image("Fitinhas de cima")
                            .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: -4, y: 6)
                        Image("Fitinhas de baixo")
                            .shadow(color: Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.25), radius: 5, x: -4, y: 6)
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

struct DrawView_Previews: PreviewProvider {
    static var previews: some View {
        DrawView()
            .previewInterfaceOrientation(.portrait)
    }
}
