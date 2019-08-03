//
//  POITableViewCell.swift
//  Grail Diary
//
//  Created by Lambda_School_Loaner_101 on 7/30/19.
//  Copyright © 2019 Ife Banire. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var clueCountLabel: UILabel!
    
    
    private func updateViews() {
        guard let unwrappedPOI = poi else { return }
        
        locationLabel.text = unwrappedPOI.location
        countryLabel.text = unwrappedPOI.country
        clueCountLabel.text = "\(unwrappedPOI.clues.count) clues"
    }
}
