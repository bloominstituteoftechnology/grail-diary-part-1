//
//  POITableViewCell.swift
//  Grail Diary
//
//  Created by William Chen on 8/14/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
   
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesCountLabel: UILabel!
    
    var poi: POI?{
        didSet{
            updateViews()
        }
    }
<<<<<<< HEAD
 
=======
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
>>>>>>> edda7f8c4e5e80b5ef2c829fd4d7aa9df2288061
    private func updateViews(){
        guard let poi = poi else {return}
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesCountLabel.text = "\(poi.clues.count) clues"
        
        
    }


}

