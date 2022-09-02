//
//  QRCodeView.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 01/09/22.
//

import Foundation
import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct QRCodeView: View {
    
    @State private var qrCode = UIImage()
    @State var text: String = "Read QR Code to join my room"

    //private let link = DrawingModel.getRandomDrawing()

    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        
        VStack{
            
            Text(text)
            
            Image(uiImage: generateQRCode(from: text))
                .resizable()
                .interpolation(.none)
                .scaledToFit()
                .frame(width: 200, height: 200)
        }
        //.onAppear(perform: updateCode)
        //.onChange(of: qrCode) { _ in updateCode() }
    }
    
    func generateQRCode(from string: String) -> UIImage {
            filter.message = Data(string.utf8)

            if let outputImage = filter.outputImage {
                if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                    return UIImage(cgImage: cgimg)
                }
            }

            return UIImage(systemName: "xmark.circle") ?? UIImage()
        }
    
    /*
    func updateCode() {
            qrCode = generateQRCode(from: link)
        }
     */
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeView()
    }
}
