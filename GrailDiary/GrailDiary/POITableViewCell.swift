//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by ronald huston jr on 4/16/20.
//  Copyright © 2020 HenryQuante. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesLabel: UILabel!
    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        locationLabel.text = poi?.location
        countryLabel.text = poi?.country
        cluesLabel.text = "\(poi?.clues.count) clues"
    } 

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
