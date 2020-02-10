//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Chad Parker on 2/6/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesCountLabel: UILabel!
    
    var poi: POI? {
        didSet {
            self.updateViews()
        }
    }

    private func updateViews() {
        guard let poi = poi else { return }

        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesCountLabel.text = "\(poi.clues.count)"
    }
}
