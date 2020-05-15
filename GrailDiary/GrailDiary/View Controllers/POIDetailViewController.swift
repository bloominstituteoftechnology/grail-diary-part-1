//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Ryan Dutson on 7/17/19.
//  Copyright © 2019 Ryan Dutson. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
   
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
}

    private func updateViews() {
        guard let poi = poi else { return }
       
    locationLabel.text  = poi.location
    countryLabel.text = poi.country
    var clueText = ""
        for clue in poi.clues {
            clueText += "∙ \(clue)\n"
        }
        
        cluesTextView.text = clueText
        
    }
}
