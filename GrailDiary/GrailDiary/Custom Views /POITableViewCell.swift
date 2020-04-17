//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Sammy Alvarado on 4/16/20.
//  Copyright © 2020 Sammy Alvarado. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var clueLabel: UILabel!
    
    var poi: POI? {
        didSet {
            self.updateViews()
        }
    }
    
    private func updateViews() {
        guard let poi = self.poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        clueLabel.text = "\(poi.clues.count)"
    }

}
