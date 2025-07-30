//
//  Untitled.swift
//  FDNavigation
//
//  Created by Gabriel Tanod on 20/07/25.
//

import Foundation
import AVFoundation

class QRScannerViewModel: ObservableObject {
    @Published var scannedCode: String?
    @Published var isPresentingMap = false

    func handleScannedCode(_ code: String) {
        scannedCode = code
        isPresentingMap = true
    }
    
}
