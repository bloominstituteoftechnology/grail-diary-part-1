//
//  POITableViewCell.swift
//  grail diary part 1
//
//  Created by brian vilchez on 8/14/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    //MARK: - properties
    var poi:POI? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var locationLabel:UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesLabel: UILabel!
    
    
    //MARK: - actions
    func updateViews() {
        guard let poi = poi else {return}
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesLabel.text = "\(poi.clues.count) clues"
        
    }

}
