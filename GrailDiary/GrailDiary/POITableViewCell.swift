//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Nichole Davidson on 1/23/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesCountLabel: UILabel!
    
    
    var poi = POI(location: <#T##String#>, country: <#T##String#>, clues: <#T##[String]#>)
        
    didSet {
        updateViews()
    }
    

    func updateViews() {
        if var unwrappedPoi = POI(location: <#T##String#>, country: <#T##String#>, clues: <#T##[String]#>) {
            
        let location = locationLabel.text
        let country = countryLabel.text
        let clues = cluesCountLabel.text
            
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
