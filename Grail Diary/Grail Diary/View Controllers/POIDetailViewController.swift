//
//  POIDetailViewController.swift
//  Grail Diary
//
//  Created by Eoin Lavery on 30/07/2019.
//  Copyright © 2019 Eoin Lavery. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesText: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        
        var index = 1
        for clue in poi.clues {
            cluesText.text += "\(index). \(clue)\n"
            index += 1
        }
    }
}
