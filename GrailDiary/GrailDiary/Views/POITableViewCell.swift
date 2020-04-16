//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Enzo Jimenez-Soto on 4/16/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
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
        cluesNumberLabel.text = "\(poi?.clues.count ?? 0) clues"
    }
}

