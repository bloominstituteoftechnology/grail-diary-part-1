//
//  POITableViewCell.swift
//  Grail Diary
//
//  Created by Kelson Hartle on 4/16/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBOutlet weak var numOfCluesLabel: UILabel!
    @IBOutlet weak var actualLocationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    var poi: POI? {
        didSet{
            updateViews()
        }
    }
    func updateViews() {
        guard let poi  = poi else { return }
        
        actualLocationLabel.text = poi.location
        countryLabel.text = poi.country
        numOfCluesLabel.text = "\(poi.clues.count)"
    }
}
