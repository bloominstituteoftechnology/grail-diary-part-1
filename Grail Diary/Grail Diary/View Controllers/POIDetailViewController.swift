//
//  POIDetailViewController.swift
//  Grail Diary
//
//  Created by Harmony Radley on 3/19/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
   var poi: POI?
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        var cluesText = ""
        for clue in poi.clues {
            cluesText += "∙ \(clue)\n"
        }
        cluesTextView.text = cluesText
    }

}
