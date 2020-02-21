//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Harmony Radley on 2/20/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
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
