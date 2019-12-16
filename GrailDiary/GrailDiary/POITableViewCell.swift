//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Jorge Alvarez on 12/12/19.
//  Copyright © 2019 Jorge Alvarez. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesNumberLabel: UILabel!
    
    var poi: POI? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews(){
        locationLabel.text = poi?.location
        countryLabel.text = poi?.country
        cluesNumberLabel.text = "\(poi?.clues.count ?? 0) clues" // ?
    }
}
