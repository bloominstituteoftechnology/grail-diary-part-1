//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by ronald huston jr on 4/16/20.
//  Copyright © 2020 HenryQuante. All rights reserved.
//

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
    private func updateViews() {
        
        cluesTextView.text = ""
        
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        
        countryLabel.text = poi.country
        
        var cluesText = ""
        for clue in poi.clues {
            cluesText += "\(clue)"
        }
        cluesTextView.text = cluesText
    }

}
