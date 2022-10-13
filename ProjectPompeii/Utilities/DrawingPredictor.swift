//
//  DrawingPredictor.swift
//  ProjectPompeii
//
//  Created by Alex A. Rocha on 25/08/22.
//

import Foundation
import Vision

struct Prediction {
    
    let classification: String
    let confidence: Float
    
}

class DrawingPredictor {
    
    func makePredictions(drawing: Drawing) -> [Prediction] {
        
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
        
        let bitmap_image = rasterize(drawing: drawing)
        let handler = VNImageRequestHandler(cgImage: bitmap_image)
        try? handler.perform([request])
        
        return predictions
        
    }
    
    func normalize(drawing D: Drawing) -> Drawing {
        let new_drawing = Drawing()
        for i in 0..<D.strokeCount() {
            for j in 0..<D.pointCount(stroke: i) {
                let current_point = D.point(stroke: i, point: j)
                var new_x, new_y : CGFloat
                if (D.max_x == D.min_x) {new_x = D.min_x}
                else {
                    new_x = (current_point.x - D.min_x) * 255.0 / (D.max_x - D.min_x)
                }
                if (D.max_y == D.min_y) {new_y = D.min_y}
                else {
                    new_y = (current_point.y - D.min_y) * 255.0 / (D.max_y - D.min_y)
                }
                let new_point = CGPoint(x: new_x, y: new_y)
                new_drawing.add(point: new_point)
            }
            new_drawing.endStroke()
        }
        return new_drawing
    }
    
    func rasterize(drawing stroke_based_drawing: Drawing) -> CGImage {
        let D = normalize(drawing: stroke_based_drawing)
        let grayscale = CGColorSpaceCreateDeviceGray()
        let intermediate_bitmap_context = CGContext(
            data: nil, width: 256, height: 256, bitsPerComponent: 8, bytesPerRow: 0,
            space: grayscale, bitmapInfo: CGImageAlphaInfo.none.rawValue)
        intermediate_bitmap_context?.setStrokeColor(
            red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let transform = CGAffineTransform.identity
        let path = CGMutablePath()
        for strokeIndex in 0..<D.strokeCount() {
            let stroke = D.stroke(index: strokeIndex)
            let startPoint = D.point(stroke: strokeIndex, point: 0)
            path.move(to: startPoint, transform: transform)
            for point in stroke {
                path.addLine(to: point as! CGPoint, transform: transform)
            }
        }
        intermediate_bitmap_context?.setLineWidth(10.0)
        intermediate_bitmap_context?.beginPath()
        intermediate_bitmap_context?.addPath(path)
        intermediate_bitmap_context?.strokePath()
        let intermediate_image = intermediate_bitmap_context?.makeImage()
        
        let final_bitmap_context = CGContext(
            data: nil, width: 28, height: 28, bitsPerComponent:8, bytesPerRow: 0,
            space: grayscale, bitmapInfo: CGImageAlphaInfo.none.rawValue)
        let final_rect = CGRect(x: 0.0, y: 0.0, width: 28.0, height: 28.0)
        final_bitmap_context?.drawImage(intermediate_image!, in: final_rect)
        return (final_bitmap_context?.makeImage())!
    }
    
    static func logPredictions(_ predictions: [Prediction], amount: Int) {
        
        for prediction in predictions.prefix(amount) {
            print(prediction.classification, String(prediction.confidence * 100.0) + " %")
        }
        
    }
    
}

extension CGContext {
    
    final func drawImage(_ image: CGImage, in rect: CGRect) {
        
        let ty: CGFloat = (rect.origin.y + rect.size.height)
        translateBy(x: 0, y: ty)
        scaleBy(x: 1.0, y: -1.0)
        
        let rect__y_zero = CGRect(x: rect.origin.x, y: 0, width: rect.width, height: rect.height)
        draw(image, in: rect__y_zero)
        
        scaleBy(x: 1.0, y: -1.0)
        translateBy(x: 0, y: -ty)
        
    }
    
}
