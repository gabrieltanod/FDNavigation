//
//  MapImageView.swift
//  FDNavigation
//
//  Created by Gabriel Tanod on 20/07/25.
//

import SwiftUI

struct MapImageView: View {
    @ObservedObject var viewModel: MapViewModel
    @GestureState private var gestureScale: CGFloat = 1.0
    @State private var zoomScale: CGFloat = 1.0
    @State private var dragOffset: CGSize = .zero

    var body: some View {
        let magnification = MagnificationGesture()
            .updating($gestureScale) { latest, gesture, _ in
                gesture = latest
            }
            .onEnded { _ in
                withAnimation(.easeOut) {
                    zoomScale = 1.0
                    dragOffset = .zero
                }
            }

        let drag = DragGesture()
            .onChanged { value in
                dragOffset = value.translation
            }
            .onEnded { _ in
                withAnimation(.easeOut) {
                    dragOffset = .zero
                }
            }

        ZStack {
            Image("map_\(viewModel.currentHall)")
                .resizable()
                .scaledToFit()
                .scaleEffect(zoomScale * gestureScale)
                .offset(dragOffset)
                .gesture(magnification.simultaneously(with: drag))
                .zIndex(1)
        }
        .frame(height: 300)
    }
}
