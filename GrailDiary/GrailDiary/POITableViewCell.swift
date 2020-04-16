//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Vincent Hoang on 4/16/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var cluesCountLabel: UILabel!
    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let unwrappedPOI = poi else {
            fatalError("POI object in POITableViewCell was null")
        }
        
        locationLabel.text = unwrappedPOI.location
        countryLabel.text = unwrappedPOI.country
        cluesCountLabel.text = "\(unwrappedPOI.clues.count) clues"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
