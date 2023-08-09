//
//  File.swift
//  IronBound
//
//  Created by Paige Phelps on 2023/08/09.
//

import Foundation
import SwiftUI

// GYM DATA MODELS

struct Gym : Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
}
