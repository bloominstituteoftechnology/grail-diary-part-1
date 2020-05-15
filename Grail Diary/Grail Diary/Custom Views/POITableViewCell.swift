//
//  POITableViewCell.swift
//  Grail Diary
//
//  Created by Lambda_School_Loaner_141 on 7/30/19.
//  Copyright © 2019 Jordan Skenandore. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var clueCountLabel: UILabel!
    
    var pointOfInterest: POI? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let pointOfInterest = pointOfInterest else {return}
        
        locationLabel.text = pointOfInterest.location
        countryLabel.text = pointOfInterest.country
        clueCountLabel.text = "\(pointOfInterest.clues.count) clues"
    }
}
