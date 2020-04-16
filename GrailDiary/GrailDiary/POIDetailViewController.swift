//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Bronson Mullens on 4/16/20.
//  Copyright © 2020 Bronson Mullens. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    private func updateViews() {
        guard let poi = self.poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesTextView.text = poi.clues.joined(separator: ", ")
    }
    
    var poi: POI?

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
}
