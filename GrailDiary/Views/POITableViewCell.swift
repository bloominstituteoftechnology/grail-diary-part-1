//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by David Williams on 2/6/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var numberOfCluesLabel: UILabel!
    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
   
    private func updateViews() {
        guard let poi = poi else { return }
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        if poi.clues.count == 1 {
            numberOfCluesLabel.text = "1 clue."
        } else {
            numberOfCluesLabel.text = "\(poi.clues.count) clues."
        }
    }
}
