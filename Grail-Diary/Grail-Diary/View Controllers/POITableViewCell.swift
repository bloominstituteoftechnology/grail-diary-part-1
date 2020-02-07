//
//  POITableViewCell.swift
//  Grail-Diary
//
//  Created by Breena Greek on 2/5/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    // MARK: IBOutlet
    @IBOutlet weak var cluesCountLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var poi: POI? {
        didSet {
            self.updateViews()
        }
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
            
   
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

        
    }
}
