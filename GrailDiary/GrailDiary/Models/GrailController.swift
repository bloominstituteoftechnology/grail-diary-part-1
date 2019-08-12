//
//  GrailController.swift
//  GrailDiary
//
//  Created by Alex Rhodes on 8/12/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import Foundation
import UIKit

class GrailController {
    
    var grailArray: [Grail] = []
    
    func addGrail(city: String, country: String, clues: [String], image: UIImage?) {
        let grail = Grail(cityOrState: city, country: country, clue: clues, image: image)
        grailArray.append(grail)
    }

}
