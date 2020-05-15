//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Fabiola S on 7/29/19.
//  Copyright © 2019 Fabiola Saga. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var clueCounterLabel: UILabel!
    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        clueCounterLabel.text = "\(poi.clues.count) clues"
        
    }

}
