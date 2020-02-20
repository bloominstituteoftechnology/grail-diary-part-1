//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Karen Rodriguez on 2/20/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesCountLabel: UILabel!
    
    var poi: POI? {
        didSet {
            print("This triggered")
            updateViews()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesCountLabel.text = "\(poi.clues.count) clue/s"
    }
}
