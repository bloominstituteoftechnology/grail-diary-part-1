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
    var poi: POI?
    
    //TODO: Add didSet Observer
    
    func configureCell(poi: POI) { //updateViews()
        locationLbl.text = poi.location
        countryLbl.text = poi.country
        cluesLbl.text = "\(poi.clues.count) clues!"
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
