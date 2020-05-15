//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Richard Gibbs on 5/14/20.
//  Copyright © 2020 Rich Gibbs. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var cluesLabel: UILabel!
    
    var poi: POI? {
        didSet{

            updateViews()
            }
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
