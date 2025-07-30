//
//  MapViewModel.swift
//  FDNavigation
//
//  Created by Gabriel Tanod on 20/07/25.
//

import Foundation
import SwiftUI

class MapViewModel: ObservableObject {
    @Published var searchText: String = "" {
        didSet {
            filterBrands()
        }
    }
    @Published var filteredBrands: [Brand] = []
    @Published var brands: [Brand] = MockData.brands
    @Published var currentHall: String = "hallB_kosongan"
    @Published var userLocation: CGPoint? = nil
    @Published var selectedBrand: Brand? = nil

    func filterBrands() {
        if searchText.isEmpty {
            filteredBrands = brands
        } else {
            filteredBrands = brands.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }

    func setLocation(for code: String) {
        print("Scanned QR Code: \(code)")

        switch code {
        case "QR1":
            print("→ Setting location for QR1")
            userLocation = CGPoint(x: 200, y: 100)
            currentHall = "hallB_center"
        case "QR2":
            print("→ Setting location for hallB_NE")
            userLocation = CGPoint(x: 0.8, y: 0.4)
            currentHall = "hallB_NE"
        default:
            print("→ Unknown QR Code")
            return
        }
    }

    func selectBrand(_ brand: Brand) {
        selectedBrand = brand
    }

    init() {
        filterBrands()
    }
}
