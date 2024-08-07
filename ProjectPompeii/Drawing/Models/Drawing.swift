//
//  Drawing.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 25/08/22.
//

import Foundation
import CoreGraphics

class Drawing {
    
    var drawing: NSMutableArray
    var stroke: NSMutableArray
    var minX: CGFloat
    var minY: CGFloat
    var maxX: CGFloat
    var maxY: CGFloat

    init() {
        drawing = NSMutableArray()
        stroke = NSMutableArray()
        minX = CGFloat.greatestFiniteMagnitude
        maxX = 0.0
        minY = CGFloat.greatestFiniteMagnitude
        maxY = 0.0
    }

    func pointCount(stroke i: Int) -> Int {
        let correspondingStroke = drawing.object(at: i) as! NSArray
        return correspondingStroke.count
    }

    func strokeCount() -> Int {
        return drawing.count
    }

    func point(stroke i: Int, point j: Int) -> CGPoint {
        let correspondingStroke = drawing.object(at: i) as! NSArray
        let answer = correspondingStroke.object(at: j) as! CGPoint
        return answer
    }

    func stroke(index i: Int) -> NSMutableArray {
        return drawing.object(at: i) as! NSMutableArray
    }

    func add(point P: CGPoint) {
        let x = P.x
        let y = P.y
        minX = min(x, minX)
        maxX = max(x, maxX)
        minY = min(y, minY)
        maxY = max(y, maxY)
        stroke.add(P)
    }

    func endStroke() {
        let newStroke = NSMutableArray()
        newStroke.addObjects(from: stroke as! [Any])
        drawing.add(newStroke)
        stroke.removeAllObjects()
    }
    
}

extension Drawing {
    
    static func getShuffledDrawings() -> [String] {
                
        let drawings = ["apple", "cactus", "fish", "headphones", "rain",
                        "skull", "snowman","stairs", "stop sign", "sun",
                        "table", "tornado", "television", "watermelon", "wine glass",
                        "popsicle", "flashlight", "sailboat", "underwear", "alarm clock"]
        
        return drawings.shuffled()
        
    }
    
    static func formatPrediction(prediction: String) -> String {
        
        let vowels: [Character] = ["a", "e", "i", "o", "u"]
        
        if vowels.contains(prediction.first!) {
            return "an " + prediction
        } else {
            return "a " + prediction
        }
        
    }
    
    func logDrawing() {
        print(drawing, terminator: "\n\n\n")
    }
    
}
