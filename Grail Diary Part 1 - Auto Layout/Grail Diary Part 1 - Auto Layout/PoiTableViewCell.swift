//
//  PoitTableViewCell.swift
//  Grail Diary Part 1 - Auto Layout
//
//  Created by Nicolas Rios on 7/17/19.
//  Copyright © 2019 Nicolas Rios. All rights reserved.
//

import UIKit

class PoiTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var hobbyListTextView: UITextView!
    
    
    var Poi: poi?{
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let Poi = Poi else { return }
        
        nameLabel.text = Poi.name
        hometownLabel.text = Poi.hometown
        hobbyCountLabel.text = "\(Poi.hobbies.count) hobbies"
    }
    
}

