//
//  POITableViewCell.swift
//  Grail Diary
//
//  Created by brian vilchez on 7/17/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var cluesCountLabel: UILabel!
    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let poi = poi else {return}
       countryLabel.text = poi.Country
        locationLabel.text = poi.location
        cluesCountLabel.text = "\(poi.clues.count) clues"
    }
}
