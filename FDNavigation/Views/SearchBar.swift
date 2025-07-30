//
//  SearchBar.swift
//  FDNavigation
//
//  Created by Gabriel Tanod on 20/07/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        TextField("Search brands...", text: $text)
            .padding(8)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal)
    }
}
