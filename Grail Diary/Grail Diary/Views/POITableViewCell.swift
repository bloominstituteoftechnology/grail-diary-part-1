//
//  POITableViewCell.swift
//  Grail Diary
//
//  Created by John Holowesko on 11/25/19.
//  Copyright © 2019 John Holowesko. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var cluesCountLabel: UILabel!
    
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
