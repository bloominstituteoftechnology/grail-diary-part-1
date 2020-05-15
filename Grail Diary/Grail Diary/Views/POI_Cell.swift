//
//  LocationCell.swift
//  Grail Diary
//
//  Created by Jeffrey Santana on 7/17/19.
//  Copyright © 2019 Jefffrey Santana. All rights reserved.
//

import UIKit

class POI_Cell: UITableViewCell {

	@IBOutlet weak var locationLbl: UILabel!
	@IBOutlet weak var countryLbl: UILabel!
	@IBOutlet weak var clueCountLbl: UILabel!
	
	var point: POI? {
		didSet {
			configCell()
		}
	}
	
	private func configCell() {
		guard let point = point else {return}
		let count = point.clues.count
		
		locationLbl.text = point.location
		countryLbl.text = point.country
		clueCountLbl.text = "\(count) \(count == 1 ? "clue" : "clues")"
	}
}
