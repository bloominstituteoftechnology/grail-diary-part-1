//
//  POITableViewCell.swift
//  Grail Diary
//
//  Created by Joseph Rogers on 7/29/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    //MARK: step 31 - 33
    //declares the labels and text views. declare optional property and pass a didset update views function through it. created update views private function for the cell. 
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

