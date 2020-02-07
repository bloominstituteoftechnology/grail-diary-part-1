//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Claudia Contreras on 2/6/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    //IBOutlet
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var cluesCountLabel: UILabel!
    
    //Reference the POI object
    var poi: POI? {
        didSet{
            self.updateViews()
        }
    }
    
    private func updateViews() {
        guard let poi = poi else {return}
        
        //use our friend object to fill in the data
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesCountLabel.text = "\(poi.clues.count) clues"
    }

}
