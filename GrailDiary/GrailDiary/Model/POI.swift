//
//  POI.swift
//  GrailDiary
//
//  Created by Chad Rutherford on 11/7/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import Foundation

/// Model Data. Blueprint for the data saved and passed around inside the app.
struct POI {
    let location: String
    let country: String
    var clues: [String]
}
