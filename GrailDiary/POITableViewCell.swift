//
//  TableViewCell.swift
//  GrailDiary
//
//  Created by Shawn James on 3/19/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesCountLabel: UILabel!
    
    // MARK: - Properties
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Methods
    private func updateViews() {
        guard let unwrappedPoi = poi else { return }
        
        var clueCount = 0
        for clue in unwrappedPoi.clues {
            if clue != "" {
                clueCount += 1
            }
        }
        
        locationLabel.text = unwrappedPoi.location
        countryLabel.text = unwrappedPoi.country
        cluesCountLabel.text = "\(clueCount) clues"
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
