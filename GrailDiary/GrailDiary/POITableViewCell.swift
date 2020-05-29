//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by James Sedlacek on 5/27/20.
//  Copyright © 2020 James Sedlacek. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesCountLabel: UILabel!
    
    var poi: POI? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews() {
        guard let poi = poi else { return }
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesCountLabel.text = "\(poi.clues.count) clues"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateViews()
    }
}
