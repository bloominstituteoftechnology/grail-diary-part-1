//
//  POITableViewCell.swift
//  Grail-Diary
//
//  Created by Marlon Raskin on 7/17/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

	@IBOutlet weak var locationLabel: UILabel!
	@IBOutlet weak var countryLabel: UILabel!
	@IBOutlet weak var cluesCountLabel: UILabel!
	
	var poi: POI? {
		didSet {
			updateViews()
		}
	}
	
	private func updateViews() {
		guard let poi = poi else { return }
		locationLabel.text = poi.location
		countryLabel.text = poi.country
		if poi.clues.count > 1 {
			cluesCountLabel.text = "\(poi.clues.count) Clues"
		} else {
			cluesCountLabel.text = "\(poi.clues.count) Clue"
		}
	}
}
