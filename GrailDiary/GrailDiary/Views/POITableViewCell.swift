//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Bryan Cress on 5/14/20.
//  Copyright © 2020 Bryan Cress. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesCountLabelLabel: UILabel!

    var poi: POI?
    
    //    func didSet() {
//
//    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
