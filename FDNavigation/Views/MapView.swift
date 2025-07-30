//
//  MapView.swift
//  FDNavigation
//
//  Created by Gabriel Tanod on 20/07/25.
//

import SwiftUI

struct MapView: View {
    @StateObject var viewModel: MapViewModel
    @FocusState private var isSearching: Bool
    @State private var showSplash = false

    var body: some View {
        VStack(spacing: 0) {
            if !isSearching {
                MapImageView(viewModel: viewModel)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 0.9)
                    .clipped()
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .animation(.easeInOut(duration: 0.3), value: isSearching)
            }

            VStack {
                SearchBar(text: $viewModel.searchText)
                    .focused($isSearching)
                BrandListView(brands: viewModel.filteredBrands, viewModel: viewModel)
            }
        }
    }
}

#Preview {
    MapView(viewModel: MapViewModel())
}
