//
//  POITableViewCell.swift
//  grail-diary-part-1
//
//  Created by Aaron on 7/30/19.
//  Copyright © 2019 AlphaGrade, INC. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet weak var countrylabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var cluesLabel: UILabel!
    
    
    var poi: POI? {
    didSet {
        updateViews()
        }
    }

   private func updateViews() {
    guard let poi = poi else { return }
        
    countrylabel.text = poi.country
    locationLabel.text = poi.location
    cluesLabel.text = "\(poi.clues.count) clues"
    
    }
    

}
