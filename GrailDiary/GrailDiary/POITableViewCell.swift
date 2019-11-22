//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Morgan Smith on 11/21/19.
//  Copyright © 2019 Morgan Smith. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var clueCountLabel: UILabel!
    
    var thePOI: POI? {
        didSet {
            updateViews()
        }
    }
   
    private func updateViews() {
        guard let thePOI = thePOI else { return }
        
        locationLabel.text = thePOI.location
        countryLabel.text = thePOI.country
        clueCountLabel.text = "\(thePOI.clues.count) clues"
    }
    
}
