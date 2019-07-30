//
//  POITableViewCell.swift
//  Grail Diary
//
//  Created by Joseph Rogers on 7/29/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {


    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UILabel!
    
    var poi: POI? {
        didSet{
            updateViews()
        }
    }
    private func updateViews(){
        guard let poi = poi else {return}
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesTextView.text = "\(poi.clues.count) clues"
        }
    }

