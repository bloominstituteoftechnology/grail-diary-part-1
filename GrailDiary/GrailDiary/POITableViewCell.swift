//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Aaron Cleveland on 12/12/19.
//  Copyright © 2019 Aaron Cleveland. All rights reserved.
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
        locationLabel.text = poi?.location
        countryLabel.text = poi?.country
        cluesCountLabel.text = "\(poi?.clues.count ?? 0) clues"
    }

}
