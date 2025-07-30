//
//  Brand.swift
//  FDNavigation
//
//  Created by Gabriel Tanod on 20/07/25.
//

import Foundation
import SwiftUI

struct Brand: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let location: CGPoint // x/y coordinate on the map
    let imageName: String
    let highlight: String
    let hallName: String
    let isMakeUp: Bool
    let isSkincare: Bool
    let isFragrance: Bool
}
