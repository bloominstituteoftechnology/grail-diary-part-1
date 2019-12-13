//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Michael on 12/12/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesCountLabel: UILabel!
    
    
    var pointOfInterest: POI? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        locationLabel.text = pointOfInterest?.location
        countryLabel.text = pointOfInterest?.country
        cluesCountLabel.text = "\(pointOfInterest?.clues.count ?? 0) clues"
    }
    
}
