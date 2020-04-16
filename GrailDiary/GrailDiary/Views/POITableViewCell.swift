//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Marissa Gonzales on 4/15/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

import UIKit

@IBDesignable
class POITableViewCell: UITableViewCell {
    
    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        
        guard let clues = poi?.clues,
            let location = poi?.location,
            let country = poi?.country else { return }
        
        locationLabel.text = location
        countryLabel.text = country
        numberOfCluesLabel.text = "\(clues)"

    }


    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    

    @IBOutlet weak var numberOfCluesLabel: UILabel!
    


}
