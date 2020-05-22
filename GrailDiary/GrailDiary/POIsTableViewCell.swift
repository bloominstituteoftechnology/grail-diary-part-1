//
//  POIsTableViewCell.swift
//  GrailDiary
//
//  Created by Norlan Tibanear on 5/21/20.
//  Copyright © 2020 Norlan Tibanear. All rights reserved.
//

import UIKit

class POIsTableViewCell: UITableViewCell {
    
    
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var numberCluesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
