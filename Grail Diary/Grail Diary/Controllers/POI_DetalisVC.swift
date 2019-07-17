//
//  POI_DetalisVC.swift
//  Grail Diary
//
//  Created by Jeffrey Santana on 7/17/19.
//  Copyright © 2019 Jefffrey Santana. All rights reserved.
//

import UIKit

class POI_DetalisVC: UIViewController {

	@IBOutlet weak var locationLbl: UILabel!
	@IBOutlet weak var countryLbl: UILabel!
	@IBOutlet weak var cluesTextView: UITextView!
	
	var point: POI?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupViews()
	}
	
	private func setupViews() {
		guard let point = point else {return}
		
		locationLbl.text = point.location
		countryLbl.text = point.country
		cluesTextView.text = ""
		for clue in point.clues {
			cluesTextView.text += "• \(clue)\n"
		}
	}
}
