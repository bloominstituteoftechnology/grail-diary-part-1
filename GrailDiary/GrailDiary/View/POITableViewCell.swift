//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Cora Jacobson on 5/29/20.
//  Copyright © 2020 Cora. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesCountLabel: UILabel!
    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        var clueLabel = "clue"
        if poi.clues.count > 1 {
            clueLabel += "s"
        }
        cluesCountLabel.text = "\(poi.clues.count) \(clueLabel)"
    }

}
