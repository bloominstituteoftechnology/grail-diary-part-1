//
//  POITableViewCell.swift
//  GrailDairy
//
//  Created by alfredo on 11/24/19.
//  Copyright © 2019 alfredo. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

//    31. Declare `IBOutlet` properties for the following cell elements: `locationLabel`, `countryLabel`, and `cluesCountLabel`; connect them to their appropriate labels in the storyboard
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var cluesCountLabel: UILabel!
    
//    32. Declare an optional property called `poi` of type `POI`; add a `didSet` observer that calls a function named `updateViews`
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
//    33. Define a private function named `updateViews`; inside, unwrap `poi` and use its properties to populate the various labels with data
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text! = poi.location
        countryLabel.text! = poi.country
        cluesCountLabel.text! = "\(poi.clues.count) clues"
    }
}

