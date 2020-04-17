//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Kenneth Jones on 4/16/20.
//  Copyright © 2020 Kenneth Jones. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var clueListTextView: UITextView!
    
    var poi: POI?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    private func updateViews() {
        guard let poi = self.poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        clueListTextView.text = poi.clues.joined(separator: ", ")
    }
}
