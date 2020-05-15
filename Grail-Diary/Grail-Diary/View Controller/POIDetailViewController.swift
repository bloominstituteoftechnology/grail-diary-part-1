//
//  POIDetailViewController.swift
//  Grail-Diary
//
//  Created by Marlon Raskin on 7/17/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var locationLabel: UILabel!
	@IBOutlet weak var countryLabel: UILabel!
	@IBOutlet weak var cluesTextView: UITextView!
	
	
	var poi: POI?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		imageView.layer.cornerRadius = 10
		updateViews()
    }
    
	func updateViews() {
		guard let poi = poi else { return }
		locationLabel.text = poi.location
		countryLabel.text = poi.country
		var clues = ""
		for clue in poi.clues {
			clues += "◦ \(clue)\n"
		}
		cluesTextView.text = clues
	}
}
