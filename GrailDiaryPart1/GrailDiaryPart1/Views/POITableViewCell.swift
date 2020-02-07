//
//  POITableViewCell.swift
//  GrailDiaryPart1
//
//  Created by Chris Price on 11/21/19.
//  Copyright © 2019 Chris Price. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var numberOfCluesLabel: UILabel!
    
    var poi: POI? {
        didSet {
            self.updateViews()
        }
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        numberOfCluesLabel.text = "\(poi.clues.count) clues"
    }

}

