//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Sammy Alvarado on 4/16/20.
//  Copyright © 2020 Sammy Alvarado. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    @IBOutlet var locationLabel: UILabel!
    
    @IBOutlet var countryLabel: UILabel!
    
    @IBOutlet var clueListTextView: UITextView!
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    private func updateViews() {
        guard let poi = self.poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        
       // clueListTextView.text = poi.clues.joined(separator: ",  ")  // No able to make this one work?
    }

}
