//
//  POI.swift
//  GrailDiary
//
//  Created by Craig Swanson on 9/25/19.
//  Copyright © 2019 Craig Swanson. All rights reserved.
//

import Foundation

struct POI: Codable {
    let location: String
    let country: String
    var clues: [String] = []
}
