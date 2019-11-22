//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Joshua Rutkowski on 11/21/19.
//  Copyright © 2019 Joshua Rutkowski. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var cluesTextView: UITextView!
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
