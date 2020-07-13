//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Lambda_School_loaner_226 on 7/8/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        var cluesText = ""
        for clues in poi.clues {
            cluesText += "• \(clues)\n"
        }
        cluesTextView.text = cluesText
    }
}
