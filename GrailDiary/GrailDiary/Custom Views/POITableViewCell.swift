//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Alex Rhodes on 7/17/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var CountryLabel: UILabel!
    @IBOutlet weak var numberOfCluesLabel: UILabel!
    
    
    var POI: POI? {
        didSet{
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let POI = POI else { return }
        
        locationLabel.text = POI.location
        CountryLabel.text = POI.country
        numberOfCluesLabel.text = "\(POI.clues.count) clues"
    }
}
