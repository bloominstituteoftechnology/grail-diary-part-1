//
//  POIDetailViewController.swift
//  GrailDiary1
//
//  Created by Taylor Lyles on 7/17/19.
//  Copyright © 2019 Taylor Lyles. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
	
	@IBOutlet weak var locationLabel: UILabel!
	@IBOutlet weak var countryLabel: UILabel!
	@IBOutlet weak var cluesTextField: UITextView!
	
	var poi: POI?
	
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
	private func updateViews() {
		guard let poi = poi else { return }
		
		locationLabel.text = poi.location
		countryLabel.text = poi.country
		var cluesText = ""
		for clue in poi.clues {
			cluesText += "- \(clue) clues"
		}
		
		cluesTextField.text = cluesText
	}
   

}
