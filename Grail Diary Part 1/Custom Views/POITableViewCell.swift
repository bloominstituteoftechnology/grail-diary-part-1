//
//  POITableViewCell.swift
//  Grail Diary Part 1
//
//  Created by Dillon P on 7/30/19.
//  Copyright © 2019 Dillon P. All rights reserved.
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
