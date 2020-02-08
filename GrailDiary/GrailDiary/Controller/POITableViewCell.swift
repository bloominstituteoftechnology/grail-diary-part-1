//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Lambda_School_loaner_226 on 12/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell
{
    
    var poi: POI?
    {
        didSet
        {
            updateViews()
        }
    }

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesCountLabel: UILabel!
    
    
    private func updateViews()
    {
        if let poiUpdate = poi
        {
            locationLabel.text = poiUpdate.location
            countryLabel.text = poiUpdate.country
            cluesCountLabel.text = String(poiUpdate.clues.count)
        }
    }
    
}
