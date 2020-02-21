//
//  POITableViewCell.swift
//  Grail Diary
//
//  Created by Gregory Omoma on 2/20/20.
//  Copyright © 2020 Gregory Omoma. All rights reserved.
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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func updateViews() {
        if let poi = poi {
            locationLabel.text = poi.location
            countryLabel.text = poi.country
            cluesCountLabel.text = "\(poi.clues.count)"
            
        }
    }
    
}

