//
//  CanvasView.swift
//  PompeiiDrawingClassifier
//
//  Created by Alex A. Rocha on 25/08/22.
//

import Foundation
import CoreGraphics

class DrawingModel {
    var drawing: NSMutableArray
    var stroke: NSMutableArray
    var min_x: CGFloat
    var min_y: CGFloat
    var max_x: CGFloat
    var max_y: CGFloat

    init() {
        drawing = NSMutableArray()
        stroke = NSMutableArray()
        min_x = CGFloat.greatestFiniteMagnitude
        max_x = 0.0
        min_y = CGFloat.greatestFiniteMagnitude
        max_y = 0.0
    }

    func pointCount(stroke i: Int) -> Int {
        let corresponding_stroke = drawing.object(at: i) as! NSArray
        return corresponding_stroke.count
    }

    func strokeCount() -> Int {
        return drawing.count
    }

    func point(stroke i: Int, point j: Int) -> CGPoint {
        let corresponding_stroke = drawing.object(at: i) as! NSArray
        let answer = corresponding_stroke.object(at: j) as! CGPoint
        return answer
    }

    func stroke(index i: Int) -> NSMutableArray {
        return drawing.object(at: i) as! NSMutableArray
    }

    func add(point P: CGPoint) {
        let x = P.x
        let y = P.y
        min_x = min(x, min_x)
        max_x = max(x, max_x)
        min_y = min(y, min_y)
        max_y = max(y, max_y)
        stroke.add(P)
    }

    func endStroke() {
        let new_stroke = NSMutableArray()
        new_stroke.addObjects(from: stroke as! [Any])
        drawing.add(new_stroke)
        stroke.removeAllObjects()
    }
        
    static func getRandomDrawing() -> String {
        
//        let drawings = ["airplane", "apple", "alarm clock", "angel", "bathtub", "beard", "bed", "binoculars", "book", "bus", "cactus", "cake", "candle", "elephant", "eyeglasses", "fish", "flashlight", "frog", "headphones", "key", "lighthouse", "lipstick", "microphone", "mouth", "panda", "parrot", "popsicle", "postcard", "purse", "rain", "rabbit", "remote control", "rollerskates", "sailboat", "skull", "snowman", "stairs", "sun", "sword", "stop sign", "table", "train", "television", "tornado", "underwear", "watermelon", "whale", "wine glass", "yoga", "zebra"]
        let drawings = ["apple", "house", "star", "sun", "zigzag"]
        
        return drawings.randomElement() ?? "None"
        
    }
    
}
