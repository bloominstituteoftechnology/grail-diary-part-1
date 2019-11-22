//
//  POITableViewCell.swift
//  GrailDairy
//
//  Created by LambdaSchoolVM_Catalina on 11/21/19.
//  Copyright © 2019 sierra. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var cluesCountLbl: UILabel!
    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let poi = poi else { return }
        locationLbl.text = poi.location
        countryLbl.text = poi.country
        cluesCountLbl.text = "\(poi.clues.count) clues"
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
