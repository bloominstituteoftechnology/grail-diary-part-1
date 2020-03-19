//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Hunter Oppel on 3/19/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
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
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesCountLabel.text = "\(poi.clues.count) clue(s)"
    }

}
