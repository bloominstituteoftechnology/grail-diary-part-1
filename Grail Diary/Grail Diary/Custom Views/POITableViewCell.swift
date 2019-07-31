//
//  POITableViewCell.swift
//  Grail Diary
//
//  Created by Jessie Ann Griffin on 7/30/19.
//  Copyright © 2019 Jessie Griffin. All rights reserved.
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
        if let poi = poi {
            locationLabel.text = poi.location
            countryLabel.text = poi.country
            cluesCountLabel.text = "\(poi.clues.count) clues"
        }
    }
}
