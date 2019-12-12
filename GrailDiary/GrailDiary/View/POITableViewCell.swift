//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Kenny on 12/11/19.
//  Copyright © 2019 Hazy Studios. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var cluesLbl: UILabel!
    

//  add a didSet observer that calls a function named updateViews
    var poi: POI? {
        //Observer (called when poi is set)
        didSet {
            configureCell()
        }
    }
    
    //TODO: Add didSet Observer
    
    func configureCell() { //updateViews()
        locationLbl.text = poi?.location
        countryLbl.text = poi?.country
        cluesLbl.text = "\(poi?.clues.count ?? 0) clues!"
    }

}
