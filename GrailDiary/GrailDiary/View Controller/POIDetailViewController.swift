//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Claudia Contreras on 2/6/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    //IBOutlets
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var cluesTextView: UITextView!
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
       // cluesTextView.text = poi.clues
    }
}
