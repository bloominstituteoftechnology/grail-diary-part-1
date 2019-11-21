//
//  POIDetailViewController.swift
//  GrailDairy
//
//  Created by Jeremy Taylor on 11/21/19.
//  Copyright © 2019 Bytes-Random L.L.C. All rights reserved.
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
        guard isViewLoaded,
            let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        
        for clue in poi.clues {
            cluesTextView.text.append(contentsOf: "\(clue)\n")
        }
    }
}
