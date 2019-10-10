//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Dennis Rudolph on 10/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var clueCountLabel: UILabel!
    
    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }

    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        clueCountLabel.text = "\(poi.clues.count) clues"
    }
}
