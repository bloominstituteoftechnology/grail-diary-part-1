//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Matthew Martindale on 2/5/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var clueCountLabel: UILabel!
    
    var poi: POI? {
        didSet {
            self.updateViews()
        }
    }

    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        clueCountLabel.text = "\(poi.clues.count) clues"
    }
}
