//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Enrique Gongora on 1/23/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesCountLabel: UILabel!
    
    var poi: POI?{
        didSet{
            updateViews()
        }
    }
    
    private func updateViews(){
        guard let unwrappedPOI = poi else { return }
        locationLabel.text = unwrappedPOI.location
        countryLabel.text = unwrappedPOI.country
        cluesCountLabel.text = "\(unwrappedPOI.clues.count) clues"
    }

}
