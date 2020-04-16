//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Clayton Watkins on 4/15/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var cluesTextField: UITextView!
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    private func updateViews(){
        guard let poi = self.poi else { return }
        countryLabel.text = poi.country
        locationLabel.text = poi.location
        cluesTextField.text = poi.clues.joined(separator: ", ")
    }
}
