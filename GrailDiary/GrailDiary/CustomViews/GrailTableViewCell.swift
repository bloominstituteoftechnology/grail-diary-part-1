//
//  GrailTableViewCell.swift
//  GrailDiary
//
//  Created by Alex Rhodes on 8/12/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import UIKit

class GrailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityStateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var numberOfCluesLabel: UILabel!
    
    
    var grail: Grail? {
        didSet {
            
        }
    }
}
