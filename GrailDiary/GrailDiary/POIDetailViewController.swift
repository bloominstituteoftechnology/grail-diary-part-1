//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Nichole Davidson on 2/20/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
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
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        
        var clueListed = ""
        for clue in poi.clues {
            clueListed += "\(clue)\n"
        }
        
        cluesTextView.text = clueListed
            
        }
    }
    
