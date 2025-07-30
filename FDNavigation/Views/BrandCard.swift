//
//  BrandCard.swift
//  FDNavigation
//
//  Created by Gabriel Tanod on 24/07/25.
//

import SwiftUI

struct BrandCard: View {
    let brand: Brand

    var body: some View {
        HStack {
            Image(brand.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.trailing, 10)

            VStack(alignment: .leading, spacing: 6) {
                Text(brand.name)
                    .font(.headline)
                    .foregroundColor(.primary)

                // Optional subtitle / category / tag
                if !brand.hallName.isEmpty {
                    Text(brand.hallName)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }

            Spacer()
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.16), radius: 2, x: 0, y: 1)
    }
}
