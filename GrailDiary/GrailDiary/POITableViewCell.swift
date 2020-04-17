//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Josh Kocsis on 4/16/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesCountLabel: UILabel!
    
    var poiArray: POI? {
            didSet {
                self.updateViews()
            }
        }
        
        private func updateViews() {
            guard let poiArray = self.poiArray else { return }
            
            locationLabel.text = poiArray.location
            countryLabel.text = poiArray.country
            cluesCountLabel.text = "\(poiArray.clues.count)"
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
