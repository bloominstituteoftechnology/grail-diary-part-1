//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Elizabeth Thomas on 2/5/20.
//  Copyright © 2020 Libby Thomas. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    
   // MARK: - IBOutlets
    
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
