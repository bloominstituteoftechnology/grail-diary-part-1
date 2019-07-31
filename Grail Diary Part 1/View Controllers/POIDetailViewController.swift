//
//  POIDetailViewController.swift
//  Grail Diary Part 1
//
//  Created by Dillon P on 7/29/19.
//  Copyright © 2019 Dillon P. All rights reserved.
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
        cluesTextView.text = "\(poi.clues)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    

    
}
