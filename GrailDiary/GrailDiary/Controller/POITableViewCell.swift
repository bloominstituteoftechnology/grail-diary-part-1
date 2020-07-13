//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Lambda_School_loaner_226 on 7/8/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesLabel: UILabel!
    
    var poi: POI? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesLabel.text = "\(poi.clues.count) clues"
    }

}
