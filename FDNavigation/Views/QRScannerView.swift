//
//  QRScannerView.swift
//  FDNavigation
//
//  Created by Gabriel Tanod on 20/07/25.
//

import SwiftUI
import CodeScanner

struct QRScannerView: View {
    @StateObject var viewModel = MapViewModel()
    @State private var navigateToMap = false

    var body: some View {
        VStack {
            Text ("Scan QR")
        }
        ZStack {
            CodeScannerView(codeTypes: [.qr]) { result in
                switch result {
                case .success(let code):
                    print("✅ SCANNED:", code.string)  // THIS IS CRUCIAL FOR DEBUGGING
                    viewModel.setLocation(for: code.string)
                    print("Current hall:", viewModel.currentHall)
                    print("User location:", viewModel.userLocation?.debugDescription ?? "nil")
                    navigateToMap = true
                case .failure(let error):
                    print("❌ Scan error:", error.localizedDescription)
                }
            }
            .ignoresSafeArea()
            
//            VStack{
//                Text("SCAN HERE")
//                    .font(.system(size: 100, weight: .bold, design: .default))
//                    .foregroundStyle(.white)
//            }
            
            // White square box
            GeometryReader { geometry in
                let size = min(geometry.size.width, geometry.size.height) * 0.6
                Rectangle()
                    .stroke(Color.white, lineWidth: 3)
                    .frame(width: size, height: size)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            }
//            VStack {
//                Spacer()
//                HStack {
//                    Image("man pointing")
//                        .resizable()
//                        .scaledToFit()
//                        .scaleEffect(x: -1, y: 1) // mirror horizontally
//                        .frame(height: 200)
//                        .padding(.trailing, 20)
//                    
//                    Spacer()
//                    
//                    Image("man pointing")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(height: 200)
//                        .padding(.leading, 20)
//
//                }
//                .padding(.bottom, 150)
//            }
            // NavigationLink
            NavigationLink(destination: MapView(viewModel: viewModel),
                           isActive: $navigateToMap) {
                EmptyView()
            }
        }
    }
}
