//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Ian Becker on 5/14/20.
//  Copyright © 2020 Ian Becker. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    var poi: POI? { didSet { updateViews() } }
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesLabel: UILabel!
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel?.text = poi.location
        countryLabel?.text = poi.country
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
