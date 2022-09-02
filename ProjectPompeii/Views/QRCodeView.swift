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
    @State var id: String = "My nickname"
    
    //@Binding var isShowing: Bool

    //private let link = DrawingModel.getRandomDrawing()

    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        
        ZStack(alignment: .center) {
            
            Color("launchScreenBackground")
                .ignoresSafeArea()

            ScrollView{
                VStack{
                        Button {
                            //
                        } label: {
                            
                            ZStack{
                                Circle()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                                    .overlay(
                                        Circle()
                                            .strokeBorder(Color("Contorno"), lineWidth: 3)
                                        )
                                Image(systemName: "xmark")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color("TertiaryColor-1"))

                            }
                            
                        }
                        .padding(.top, 36)

                    Text("Leave")
                        .foregroundColor(.white)
                        .font(.custom("Rubik-Italic-VariableFont_wght", size: 14))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 12)

                    Text("Show the QR CODE below to your friends to join your game!")
                        .multilineTextAlignment(.center)
                        .frame(width: 263, height: 42)
                        .foregroundColor(.white)
                        .font(.custom("Rubik-Italic-VariableFont_wght", size: 14))
                        .padding(.bottom, 23)

                    //Text(id)
                    
                    ZStack{
                        Image("postit qrcode")
                        Image(uiImage: generateQRCode(from: id))
                            .resizable()
                            .interpolation(.none)
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    }
                    .padding(.bottom, 38)
                    
                    Text(id)
                        .padding(.bottom, 225)
                    
                    Button {
                        //
                    } label: {
                        ZStack{
                            Circle()
                                .frame(width: 82.08, height: 82.1)
                                .foregroundColor(Color(UIColor(red: 0.99, green: 0.94, blue: 0.00, alpha: 1.00)))
                                .overlay(
                                    Circle()
                                        .strokeBorder(Color("Contorno"), lineWidth: 3)
                                    )
                            Image(systemName: "forward.end.fill")
                                .resizable()
                                .frame(width: 42.52, height: 46.49)
                                .foregroundColor(Color("TertiaryColor-1"))
                        }
                    }
                    Text("Start")
                        .foregroundColor(.white)
                        .font(.custom("Rubik-Italic-VariableFont_wght", size: 14))
                        .multilineTextAlignment(.center)
                    
                }
                .padding(.bottom, 39.42)

                //.onAppear(perform: updateCode)
                //.onChange(of: qrCode) { _ in updateCode() }
                
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()

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
            .preferredColorScheme(.dark)
    }
}
