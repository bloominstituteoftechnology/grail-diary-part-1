//
//  POITableViewCell.swift
//  Grail Diary Part 1
//
//  Created by Dojo on 5/28/20.
//  Copyright © 2020 Dojo. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesCount: UILabel!
    
    var poi: POI?{
        didSet{
            updateViews()
        }
    }
    
    private func updateViews(){
        guard let unwrappedPOI = poi else { return }
        locationLabel.text = unwrappedPOI.location
        countryLabel.text = unwrappedPOI.country
        cluesCount.text = "\(unwrappedPOI.clues.count) clues"
    }
    
}
