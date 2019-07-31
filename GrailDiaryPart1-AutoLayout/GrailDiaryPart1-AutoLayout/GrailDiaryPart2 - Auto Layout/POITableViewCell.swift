//
//  POITableViewCell.swift
//  GrailDiaryPart1-AutoLayout
//
//  Created by Lisa Fisher on 7/30/19.
//  Copyright © 2019 Lisa Fisher. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cluesCountLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!

    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    private func updateViews() {
        guard let poi = poi else { return }

        countryLabel.text = poi.country
        locationLabel.text = poi.location
        cluesCountLabel.text = "\(poi.clues.count) clues"
    }
}

    
    

  



