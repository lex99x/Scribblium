//
//  DrawLandscapeView.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 18/08/22.
//

import SwiftUI

struct DrawLandscapeView: View {
    @State private var drawing = [Line]()
    @State private var suggestion = DrawModel.getRandomDrawing()

    var body: some View {
        ZStack {
            
            Color(UIColor(red: 0.71, green: 0.71, blue: 0.71, alpha: 1.00))
                .ignoresSafeArea()
            HStack {
                VStack {
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
                    .frame(width: 482.51, height: 250)
                    //padrão em todos os modos
                    .background(Color(UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)))
                    .border(Color(UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.00)))
                    .cornerRadius(31)
                    .padding(.horizontal)
                    .padding(.horizontal)
                    .padding(.horizontal)
                    .padding(.horizontal)
                    .padding(.vertical)


                                        
                    Text(suggestion)
                        .frame(width: 142, height: 36.05)
                        .font(.system(.title))
                }
                VStack {
                    Button(action: {
                        suggestion = DrawModel.getRandomDrawing()
                        drawing = [Line]()
                    }) {
                            ZStack{
                                Circle()
                                    .frame(width: 83, height: 83)
                                    .foregroundColor(Color(UIColor(red: 0.86, green: 0.86, blue: 0.85, alpha: 1.00)))
                                    .background(Circle().foregroundColor(Color(UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)))
                                        .frame(width: 85, height: 85))
                                Image(systemName: "checkmark")
                                    .foregroundColor(Color.black)
                            }
                        }
                    .padding(.vertical)
                    .padding(.vertical)
                    .padding(.vertical)
                    
                    Button(action: {
                        drawing = [Line]()}) {
                            ZStack{
                                Circle()
                                    .frame(width: 83, height: 83)
                                    .foregroundColor(Color(UIColor(red: 0.86, green: 0.86, blue: 0.85, alpha: 1.00)))
                                    .background(Circle().foregroundColor(Color(UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)))
                                        .frame(width: 85, height: 85))
                                Image(systemName: "trash.fill")
                                    .foregroundColor(Color.black)
                            }
                        }
                        .padding(.vertical)
                        .padding(.vertical)
                        .padding(.vertical)                    
                }
            }
        }
    }
}

struct DrawLandscapeView_Previews: PreviewProvider {
    static var previews: some View {
        DrawLandscapeView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
