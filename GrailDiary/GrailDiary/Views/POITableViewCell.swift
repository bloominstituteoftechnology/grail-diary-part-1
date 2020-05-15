//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Mike Nichols on 5/14/20.
//  Copyright © 2020 Mike Nichols. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    // #31
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesCountLabel: UILabel!
    
    // #32
    
    var poi: POI? {
        didSet{
            
            updateViews()
            
        }
    }
    
    // #33
    
    private func updateViews() {
                   if let poi = poi {
                       locationLabel.text = poi.location.description
                       countryLabel.text = poi.country.description
                       cluesCountLabel.text = String(poi.clues.count)
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
