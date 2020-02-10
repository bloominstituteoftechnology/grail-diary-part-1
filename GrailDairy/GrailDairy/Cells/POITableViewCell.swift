//
//  POITableViewCell.swift
//  GrailDairy
//
//  Created by Waseem Idelbi on 11/21/19.
//  Copyright © 2019 Waseem Idelbi. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var cluesLabel: UILabel!
    
    

    
    var poi: POI? {
        didSet {
            self.updateViews()
        }
    }
    
    private func updateViews() {
        guard let poi = poi else {return}
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesLabel.text = "\(poi.clues.count) clues"
    }


    
}
