//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Ian French on 4/16/20.
//  Copyright © 2020 Ian French. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var cluesCountLabel: UILabel!
    
    var poi: POI? {
        didSet {
            self.updateViews()
        }
    }
    
    private func updateViews() {
        guard let poi = self.poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesCountLabel.text = "\(poi.clues.count)"
    }
    
    
    
    
    
    
    
}
