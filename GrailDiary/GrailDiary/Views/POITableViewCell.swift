//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Shawn Gee on 2/18/20.
//  Copyright © 2020 Swift Student. All rights reserved.
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
        guard let poi = poi else { return }
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesCountLabel.text = String(poi.clues.count)
    }

}
