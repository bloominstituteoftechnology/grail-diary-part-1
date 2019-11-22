//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Joshua Rutkowski on 11/21/19.
//  Copyright © 2019 Joshua Rutkowski. All rights reserved.

import UIKit

class POIDetailViewController: UIViewController {
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    func updateViews() {
        guard let poi = poi else { return }
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        var cluesText = ""
        for clue in poi.clues {
            cluesText += "⦿\(clue)\n"
        }
        cluesTextView.text = cluesText
    }

}
