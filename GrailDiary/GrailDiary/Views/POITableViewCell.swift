//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Jon Bash on 2019-10-10.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesCountLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesCountLabel.text = "\(poi.clues.count) clues"
    }
}
