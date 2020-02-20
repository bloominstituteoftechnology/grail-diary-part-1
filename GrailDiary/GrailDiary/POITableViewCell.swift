//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Bradley Diroff on 2/20/20.
//  Copyright © 2020 Bradley Diroff. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var cluesCountLabel: UILabel!
    
    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let poi = poi else {return}
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesCountLabel.text = "\(poi.clues.count) clues"
        
    }

}
