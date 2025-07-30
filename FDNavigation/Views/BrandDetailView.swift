//
//  BrandDetailView.swift
//  FDNavigation
//
//  Created by Gabriel Tanod on 20/07/25.
//

import SwiftUI

struct BrandDetailView: View {
    @ObservedObject var viewModel: BrandDetailViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            GeometryReader { geometry in
                Image(viewModel.brand.highlight)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width)
            }
            .padding(.top, 50)
            Divider()
            HStack(alignment: .center, spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                        .shadow(
                            color: .black.opacity(0.1),
                            radius: 8,
                            x: 0,
                            y: 4
                        )

                    Image(viewModel.brand.imageName)
                        .resizable()
                        .scaledToFill()
                    //                        .padding(12)
                }
                .frame(width: 85, height: 85)
                VStack(alignment: .leading) {
                    Text(viewModel.brand.name)
                        .font(.title)
                        .fontWeight(.semibold)
                    Text(viewModel.brand.hallName)
                        .font(.subheadline)
                        .fontWeight(.medium)

                }

            }
            .padding()
            HStack(spacing: 8) {
                if viewModel.brand.isMakeUp == true {
                    Text("Makeup")
                        .font(.caption)
                        .foregroundColor(Color(hex: "DB284E"))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color(hex: "FDEBF4"))
                        .cornerRadius(20)
                }
                if viewModel.brand.isSkincare == true {
                    Text("Skincare")
                        .font(.caption)
                        .foregroundColor(Color(hex: "DB284E"))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color(hex: "FDEBF4"))
                        .cornerRadius(20)
                }
                if viewModel.brand.isFragrance == true {
                    Text("Fragrance")
                        .font(.caption)
                        .foregroundColor(Color(hex: "DB284E"))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color(hex: "FDEBF4"))
                        .cornerRadius(20)
                }
            }
            .padding([.top, .leading], 16)

            Text(viewModel.brand.description)
                .font(.body)
                .foregroundColor(.secondary)
                .padding()

            Spacer()

        }
        //        .padding()
    }
}

#Preview {
    let mockBrand = Brand(
        name: "Skintific",
        description: "hello this is a scooter",
        location: CGPoint(x: 100, y: 200),
        imageName: "Skintific",
        highlight: "skintificHallBnorthEast",
        hallName: "Hall A",
        isMakeUp: true,
        isSkincare: false,
        isFragrance: true
    )
    let viewModel = BrandDetailViewModel(brand: mockBrand)
    return BrandDetailView(viewModel: viewModel)
}
