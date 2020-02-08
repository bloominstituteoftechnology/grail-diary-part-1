//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Tobi Kuyoro on 12/12/2019.
//  Copyright © 2019 Tobi Kuyoro. All rights reserved.
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
