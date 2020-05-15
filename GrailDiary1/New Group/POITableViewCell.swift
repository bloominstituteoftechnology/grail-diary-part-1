//
//  POITableViewCell.swift
//  GrailDiary1
//
//  Created by Taylor Lyles on 7/17/19.
//  Copyright © 2019 Taylor Lyles. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
	
	@IBOutlet weak var locationLabel: UILabel!
	@IBOutlet weak var countryLabel: UILabel!
	@IBOutlet weak var clueCountLabel: UILabel!
	

	var clue: POI? {
		didSet {
			updateViews()
		}
	}
	
	private func updateViews() {
		guard let clue = clue else { return }
		
		locationLabel.text = clue.location
		countryLabel.text = clue.country
		clueCountLabel.text = "\(clue.clues.count) clues"
	}
	
}
