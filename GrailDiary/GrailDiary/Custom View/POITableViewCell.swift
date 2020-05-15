//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Bradley Yin on 7/17/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var numberOfCluesLabel: UILabel!
    
    var POI : POI?{
        didSet{
            updateView()
        }
    }

    private func updateView() {
        guard let POI = POI else {return}
        locationLabel.text = POI.location
        countryLabel.text = POI.country
        numberOfCluesLabel.text = "\(POI.clues.count) clues"
    }
    

}
