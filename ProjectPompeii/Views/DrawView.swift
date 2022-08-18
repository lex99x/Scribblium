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
        ZStack {
            
            Color("DrawBackground")
                .ignoresSafeArea()
            Image("padraoPortrait")
            
            VStack {/*
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
                ZStack {
                    Image("MolduraCanvas")
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

                    VStack {
                        Image("Fitinhas de cima")
                            .offset(y: -150)
                        Image("Fitinhas de baixo")
                            .offset(y: 150)
                    }

                }
                
                Text(suggestion)
                    .frame(width: 142, height: 36.05)
                    .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                    .font(.custom("RubikMarkerHatch-Regular", size: 32))
                
                    .padding()
                
                HStack {
                    Button(action: {
                        drawing = [Line]()}) {
                            ZStack{
                                Circle()
                                    .frame(width: 83, height: 83)
                                    .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                                    .background(Circle().foregroundColor(Color("Contorno"))
                                        .frame(width: 87, height: 87))
                                Image("lixeira fechada")
                            }
                        }
                        .padding(.horizontal)
                        .padding(.horizontal)
                        .padding(.horizontal)
                    Button(action: {
                        suggestion = DrawModel.getRandomDrawing()
                        drawing = [Line]()
                    }) {
                            ZStack{
                                Circle()
                                    .frame(width: 83, height: 83)
                                    .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                                    .background(Circle().foregroundColor(Color("Contorno"))
                                        .frame(width: 87, height: 87))
                                Image("enviar")
                            }
                        }
                    .padding(.horizontal)
                    .padding(.horizontal)
                    .padding(.horizontal)
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
