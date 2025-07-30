//
//  BrandListView.swift
//  FDNavigation
//
//  Created by Gabriel Tanod on 20/07/25.
//

import SwiftUI

struct BrandListView: View {
    let brands: [Brand]
    @State private var selectedCategories: Set<String> = []
    @State private var isShowingCategorySheet = false
    @State private var selectedBrand: Brand? = nil
    @ObservedObject var viewModel: MapViewModel
    var navigationTitle: String {
        switch viewModel.currentHall {
        case "hallB_NE", "hallB_center", "hallB":
            return "Hall B"
        case "hallA":
            return "Hall A"
        default:
            return "Brands"
        }
    }
    var filteredBrandsByCategory: [Brand] {
        if selectedCategories.isEmpty {
            return brands
        }
        return brands.filter { brand in
            (selectedCategories.contains("Makeup") && brand.isMakeUp) ||
            (selectedCategories.contains("Skincare") && brand.isSkincare) ||
            (selectedCategories.contains("Fragrance") && brand.isFragrance)
        }
    }
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text("List of Brands")
                    .font(.subheadline)
                Spacer()
                Button(action: {
                    isShowingCategorySheet = true
                }) {
                    Image(systemName: "slider.horizontal.3")
                        .padding(8)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal)
            .padding(.top)

            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(filteredBrandsByCategory) { brand in
                        Button {
                            selectedBrand = brand
                        } label: {
                            BrandCard(brand: brand)
                                .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.top)
            }
            .navigationTitle(navigationTitle)
            .background(Color(.white))
            .sheet(item: $selectedBrand) { brand in
                BrandDetailView(viewModel: BrandDetailViewModel(brand: brand))
                    .presentationDetents([.large])
                    .overlay(alignment: .topLeading) {
                        Button(action: {
                            selectedBrand = nil
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title2)
                                .foregroundColor(.gray)
                                .padding()
                        }
                    }
            }
            .sheet(isPresented: $isShowingCategorySheet) {
                VStack {
                    Text("Select Categories")
                        .font(.headline)
                        .padding()

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(["Makeup", "Skincare", "Fragrance"], id: \.self) { category in
                                Button(action: {
                                    if selectedCategories.contains(category) {
                                        selectedCategories.remove(category)
                                    } else {
                                        selectedCategories.insert(category)
                                    }
                                }) {
                                    Text(category)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(selectedCategories.contains(category) ? Color.pink : Color.gray.opacity(0.2))
                                        .foregroundColor(.white)
                                        .cornerRadius(12)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    Spacer()

                    Button("Done") {
                        isShowingCategorySheet = false
                    }
                    .padding()
                }
            }
        }
    }
}



    
