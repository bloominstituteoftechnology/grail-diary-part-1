//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Jonalynn Masters on 9/12/19.
//  Copyright © 2019 Jonalynn Masters. All rights reserved.
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
        numberOfCluesLabel.text = "\(poi.clues.count) POI"
    
    
    }

}
