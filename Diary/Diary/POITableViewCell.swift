//
//  POITableViewCell.swift
//  Diary
//
//  Created by Lydia Zhang on 2/20/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    @IBOutlet weak var clueL: UILabel!
    @IBOutlet weak var countryL: UILabel!
    @IBOutlet weak var locationL: UILabel!
    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let poi = poi else {
            return
        }
        locationL.text = poi.location
        countryL.text = poi.country
        clueL.text = "\(poi.clue.count) clues."
    }
    @IBAction func add(_ sender: Any) {
    }
    
}
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }


