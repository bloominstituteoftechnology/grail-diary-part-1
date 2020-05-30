//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by John McCants on 5/19/20.
//  Copyright © 2020 John McCants. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

   private func updateViews() {
          guard let unwrappedPOI = poi else {
              return
          }
        locationLabel.text = unwrappedPOI.location
        countryLabel.text = unwrappedPOI.country
        cluesLabel.text = "\(unwrappedPOI.clues.count) clues"
        
          
      }
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesLabel: UILabel!
    
    var poi: POI? {
           didSet {
               updateViews()
            print("the update views is working inside poi")
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
