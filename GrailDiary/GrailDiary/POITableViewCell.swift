//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Kenneth Jones on 4/16/20.
//  Copyright © 2020 Kenneth Jones. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesLabel: UILabel!
    
    var poi: POI? {
        didSet {
            self.updateViews()
        }
    }
    
    private func updateViews() {
        guard let poi = self.poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesLabel.text = "\(poi.clues.count) clues"
    }
}
