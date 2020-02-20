//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Wyatt Harrell on 2/20/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var numberOfCluesLabel: UILabel!
    
    
    var poi: POI? {
        didSet{
            updateViews()
        }
    }

    func updateViews() {
        guard let poi = poi else { return }
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        numberOfCluesLabel.text = "#\(poi.clues.count) of clues"
        
        
        
    }
}
