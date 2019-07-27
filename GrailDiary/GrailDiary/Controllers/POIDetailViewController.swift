//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by John Kouris on 7/24/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var cluesTextView: UITextView!
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesTextView.text = "\u{2022} \(poi.clues[0])\n\u{2022} \(poi.clues[1])\n\u{2022} \(poi.clues[2])"
    }

}
