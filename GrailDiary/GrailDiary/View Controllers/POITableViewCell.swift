//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Robert on 2/5/20.
//  Copyright © 2020 Robs Creations. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesLabel: UILabel!
    
    var poi: POI? {
        didSet{
            updateViews()
        }
    }
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        if (poi.clues.count == 1) {
            cluesLabel.text = "\(poi.clues.count) clue"
        } else {
            cluesLabel.text = "\(poi.clues.count) clues"
        }
    }
    
}


