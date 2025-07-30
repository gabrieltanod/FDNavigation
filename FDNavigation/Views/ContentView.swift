//
//  ContentView.swift
//  FDNavigation
//
//  Created by Gabriel Tanod on 20/07/25.
//

import SwiftUI
import Foundation

struct ContentView: View {
    var body: some View {
        NavigationStack {
            QRScannerView(viewModel: MapViewModel())
        }
    }
}

#Preview {
    ContentView()
}
