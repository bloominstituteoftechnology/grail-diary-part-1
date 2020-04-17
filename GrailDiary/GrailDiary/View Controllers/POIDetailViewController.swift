//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Rob Vance on 4/15/20.
//  Copyright © 2020 Robs Creations. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
// Mark: IBOutlets
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesListTextView: UITextView!
    
    var poi: POI?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

    }
    private func updateViews() {
        guard let poi = self.poi else { return }
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        
        cluesListTextView.text = poi.clues.joined(separator: ", ")
    }



}
