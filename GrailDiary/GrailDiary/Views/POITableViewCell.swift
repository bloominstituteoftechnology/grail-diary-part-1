//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by David Wright on 11/21/19.
//  Copyright © 2019 David Wright. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var cluesCountLabel: UILabel!
    
    // MARK: - Properties
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        if poi.clues.count == 1 {
            cluesCountLabel.text = "\(poi.clues.count) clue"
        } else {
            cluesCountLabel.text = "\(poi.clues.count) clues"
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

}
