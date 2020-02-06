//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Lambda_School_Loaner_259 on 2/6/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    // MARK: Properties
    var poi: POI = POI(location: "Stonehenge", country: "England", clues: ["Stones", "Mystery", "Tourist Attraction"])

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
