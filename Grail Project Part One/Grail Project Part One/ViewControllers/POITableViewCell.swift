//
//  POITableViewCell.swift
//  Grail Project Part OneTests
//
//  Created by Eugene White on 6/2/20.
//  Copyright © 2020 Eugene White. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var country: UILabel!
    
    @IBOutlet weak var numberOfCluesLabel: UILabel!
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

 private func updateViews() {
            guard let poi = poi else { return }
    location.text = poi.location
            country.text = poi.country
            var clueLabel = "clue"
            if poi.clues.count > 1 {
                clueLabel += "s"
            }
    numberOfCluesLabel.text = "\(poi.clues.count) \(numberOfCluesLabel)"
        }

    }
