//
//  DrawingPredictor.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 25/08/22.
//

import Vision

class DrawingPredictor {
    
    static func makePredictions(drawing: Drawing) -> [Prediction] {
        
        var predictions: [Prediction] = []
        
        let config = MLModelConfiguration()
        let model = try? VNCoreMLModel(for: DrawingClassifierModel(configuration: config).model)
        
        let request = VNCoreMLRequest(model: model!, completionHandler: { [] request, error in
            
            if let results = request.results! as? [VNClassificationObservation] {
                for result in results {
                    predictions.append(Prediction(classification: result.identifier, confidence: result.confidence))
                }
            }
            
        })
        
        let bitmapImage = rasterize(drawing: drawing)
        let handler = VNImageRequestHandler(cgImage: bitmapImage)
        try? handler.perform([request])
        
        return predictions
        
    }
    
}

extension DrawingPredictor { // Helpers
    
    static func normalize(drawing: Drawing) -> Drawing {
        let newDrawing = Drawing()
        for i in 0..<drawing.strokeCount() {
            for j in 0..<drawing.pointCount(stroke: i) {
                let currentPoint = drawing.point(stroke: i, point: j)
                var newX, newY: CGFloat
                if (drawing.maxX == drawing.minX) {newX = drawing.minX}
                else {
                    newX = (currentPoint.x - drawing.minX) * 255.0 / (drawing.maxX - drawing.minX)
                }
                if (drawing.maxY == drawing.minY) {newY = drawing.minY}
                else {
                    newY = (currentPoint.y - drawing.minY) * 255.0 / (drawing.maxY - drawing.minY)
                }
                let newPoint = CGPoint(x: newX, y: newY)
                newDrawing.add(point: newPoint)
            }
            newDrawing.endStroke()
        }
        return newDrawing
    }
    
    static func rasterize(drawing strokeBasedDrawing: Drawing) -> CGImage {
        let drawing = normalize(drawing: strokeBasedDrawing)
        let grayscale = CGColorSpaceCreateDeviceGray()
        let intermediateBitmapContext = CGContext(
            data: nil, width: 256, height: 256, bitsPerComponent: 8, bytesPerRow: 0,
            space: grayscale, bitmapInfo: CGImageAlphaInfo.none.rawValue)
        intermediateBitmapContext?.setStrokeColor(
            red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let transform = CGAffineTransform.identity
        let path = CGMutablePath()
        for strokeIndex in 0..<drawing.strokeCount() {
            let stroke = drawing.stroke(index: strokeIndex)
            let startPoint = drawing.point(stroke: strokeIndex, point: 0)
            path.move(to: startPoint, transform: transform)
            for point in stroke {
                path.addLine(to: point as! CGPoint, transform: transform)
            }
        }
        intermediateBitmapContext?.setLineWidth(10.0)
        intermediateBitmapContext?.beginPath()
        intermediateBitmapContext?.addPath(path)
        intermediateBitmapContext?.strokePath()
        let intermediateImage = intermediateBitmapContext?.makeImage()
        
        let finalBitmapContext = CGContext(
            data: nil, width: 28, height: 28, bitsPerComponent:8, bytesPerRow: 0,
            space: grayscale, bitmapInfo: CGImageAlphaInfo.none.rawValue)
        let finalRect = CGRect(x: 0.0, y: 0.0, width: 28.0, height: 28.0)
        finalBitmapContext?.drawImage(intermediateImage!, in: finalRect)
        return (finalBitmapContext?.makeImage())!
    }
    
}
