//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Tobi Kuyoro on 12/12/2019.
//  Copyright © 2019 Tobi Kuyoro. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI?
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        
        var pois = ""
        for clue in poi.clues {
            pois.append("-\(clue)\n")
        }
        
        cluesTextView.text = pois
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
}
