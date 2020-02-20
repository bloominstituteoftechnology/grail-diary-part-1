//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by dc on 2/20/20.
//  Copyright © 2020 Diego Covarrubias. All rights reserved.
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
    
    func updateViews() {
        if let poi = self.poi {
            locationLabel.text = poi.location
            countryLabel.text = poi.country
            cluesCountLabel.text = String(poi.clues.count)
        }
    }
}
