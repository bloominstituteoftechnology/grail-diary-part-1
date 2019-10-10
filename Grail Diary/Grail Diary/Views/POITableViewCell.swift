//
//  POITableViewCell.swift
//  Grail Diary
//
//  Created by Niranjan Kumar on 10/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesLabel: UILabel!

    var poi: POI? {
        didSet {
            
        }
    }
    

    private func updateViews() {
        guard let poi = poi else { return }
    
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesLabel.text = "\(poi.clues.count) of clues"
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
