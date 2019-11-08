//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Patrick Millet on 11/7/19.
//  Copyright © 2019 Patrick Millet. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesCountLabel: UILabel!

    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesCountLabel.text = "\(poi.clues.count) clues"
    }
}
