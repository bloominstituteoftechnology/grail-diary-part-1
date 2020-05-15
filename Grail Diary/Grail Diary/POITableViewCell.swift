//
//  POITableViewCell.swift
//  Grail Diary
//
//  Created by Joel Groomer on 7/30/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblClueCount: UILabel!
    
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
        guard let poi = poi else { return }
        
        lblLocation.text = poi.location
        lblCountry.text = poi.country
        lblClueCount.text = "\(poi.clues.count) clues"
    }
}
