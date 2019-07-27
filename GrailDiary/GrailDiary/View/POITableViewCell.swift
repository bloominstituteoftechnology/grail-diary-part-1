//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by John Kouris on 7/24/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var countrylabel: UILabel!
    @IBOutlet var numberOfCluesLabel: UILabel!
    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func updateViews() {
        if let poi = poi {
            locationLabel.text = poi.location
            countrylabel.text = poi.country
            if poi.clues.count == 1 {
                numberOfCluesLabel.text = "\(poi.clues.count) clue"
            } else {
                numberOfCluesLabel.text = "\(poi.clues.count) clues"
            }
            
        }
    }

}
