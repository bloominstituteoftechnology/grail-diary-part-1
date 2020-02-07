//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by David Williams on 2/6/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextField: UITextView!
    
    var poi: POI? {
        didSet {
            self.updateViews()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
updateViews()
    }
    
    private func updateViews() {
        guard let poi = poi,
            isViewLoaded else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesTextField.text = poi.clues.joined(separator: "\n")
    }
}
