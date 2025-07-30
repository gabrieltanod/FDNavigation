//
//  BrandDetailViewModel.swift
//  FDNavigation
//
//  Created by Gabriel Tanod on 20/07/25.
//

import Foundation

class BrandDetailViewModel: ObservableObject {
    @Published var brand: Brand

    init(brand: Brand) {
        self.brand = brand
    }
}
