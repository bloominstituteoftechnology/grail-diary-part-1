//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Nihal Erdal on 3/19/20.
//  Copyright © 2020 Nihal Erdal. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var cluesLabel: UILabel!
    
    var poi : POI? {
        
        didSet{
            
            updateViews()
        }
    }
      
    private func updateViews(){
        
        guard let poi = poi else {return}
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        
        cluesLabel.text = "\(poi.clues.count) of clues"
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
