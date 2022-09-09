//
//  QRCodeScannerView.swift
//  ProjectPompeii
//
//  Created by Ana Kiara Medeiros Braga on 01/09/22.
//

import CodeScanner
import SwiftUI

struct QRCodeScannerView: View {
    
    @State var isShowingScanner = false
    @State var scannedCode: String = "Scan a QR Code to get started."
    
    var scannerSheet : some View {
                        
        CodeScannerView(codeTypes: [.qr], completion: {
            result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    self.isShowingScanner = false
                }
            }
        )
    }

    
    var body: some View {
        
        VStack(spacing: 10) {
            Text(scannedCode)
            
            Button("Scan QR Code"){
                self.isShowingScanner = true
            }
            .sheet(isPresented: $isShowingScanner) {
                self.scannerSheet
            }
        }
        
    }
}

struct QRCodeScannerView_previews: PreviewProvider {
    static var previews: some View {
        QRCodeScannerView()
    }
}


