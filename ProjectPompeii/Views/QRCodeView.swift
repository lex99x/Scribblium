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
    
    @ObservedObject var connection: GameConnectionService
    
    @State private var qrCode = UIImage()
    @State var id: String = "My nickname"
    
    let names = ["Alex", "Ana", "Matheus", "Unknown"]
    
    //@Binding var isShowing: Bool

    //private let link = DrawingModel.getRandomDrawing()

    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    @State var isShowingScanner = true

    
    var body: some View {
        
        ZStack(alignment: .center) {
            
            Color("launchScreenBackground")
                .ignoresSafeArea()

            ScrollView{
                VStack{
                        Button {
                            isShowingScanner = false

                        } label: {
                            
                                Image(systemName: "xmark.circle.fill")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(Color("SecondaryColor-1"))
                                    .overlay(
                                        Circle()
                                            .strokeBorder(Color("Contorno"), lineWidth: 3))
                                    .font(.system(size: 20, weight: .bold))
                                    .background(Circle().foregroundColor(Color("TertiaryColor-1")))
                            
                            
                        }
                        .padding(.top, 36)

                    Text("Leave")
                        .foregroundColor(.white)
                        .font(.custom("RubikMarkerHatch-Regular", size: 14))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 12)

                    Text("Show the QR CODE below to your friends to join your game!")
                        .multilineTextAlignment(.center)
                        .frame(width: 263, height: 42)
                        .foregroundColor(.white)
                        .font(.custom("RubikMarkerHatch-Regular", size: 14))
                        .padding(.bottom, 23)

                    //Text(id)
                    
                    ZStack{
                        Image("postit qrcode")
                        VStack {
                            Image(uiImage: generateQRCode(from: connection.getDeviceId()))
                                .resizable()
                                .interpolation(.none)
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                                .padding(.bottom)
                            Text(connection.getDeviceName())
                                .font(.custom("RubikMarkerHatch-Regular", size: 17))
                        }
                        .padding(.top, 50)
                    }
                    .padding(.bottom, 50)
                    
                    ForEach(names, id: \.self) { name in
                        HStack {
                            Text("@"+name)
                                .font(.custom("RubikMarkerHatch-Regular", size: 17))
                                .padding([.horizontal], 16)
                            Spacer()
                            Image(systemName: "checkmark.circle")
                                .font(.system(size: 28))
                                .foregroundColor(Color("TertiaryColor-1"))
                                .padding([.horizontal], 16)

                        }
                        .frame(width: 338, height: 48)
                        .border(Color("TertiaryColor-1"), width: 3)
                        .background(Color("SecondaryColor-1"))
                        .cornerRadius(14)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .strokeBorder(Color("TertiaryColor-1"), lineWidth: 3)
                        )
                    }
                    
                    Button {
                        //
                    } label: {
                        ZStack {
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
                    .padding([.top], 41)

                    Text("Start")
                        .foregroundColor(.white)
                        .font(.custom("RubikMarkerHatch-Regular", size: 14))
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
        QRCodeView(connection: GameConnectionService())
            .previewInterfaceOrientation(.portrait)
            
    }
}
