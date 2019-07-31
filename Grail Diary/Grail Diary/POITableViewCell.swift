//
//  POITableViewCell.swift
//  Grail Diary
//
//  Created by Thomas Dye on 07/29/2019.
//  Copyright © 2019 Thomas Dye. All rights reserved.
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
        locationLabel.text = poi.city
        countryLabel.text = poi.country
        cluesCountLabel.text = "\(poi.clues.count) Clues"
    }
}
