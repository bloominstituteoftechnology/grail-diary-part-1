//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Bronson Mullens on 4/16/20.
//  Copyright © 2020 Bronson Mullens. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func updateViews() {
        guard let poi = self.poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesCountLabel.text = "\(poi.clues.count) clues"
    }
    
    var poi: POI? {
        didSet {
            self.updateViews()
        }
    }
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesCountLabel: UILabel!
    

}
