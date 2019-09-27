//
//  POIDetailViewController.swift
//  GrailDairy
//
//  Created by denis cedeno on 9/26/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI?
    
    private func updateViews() {
        guard let poi = poi, isViewLoaded else { return }
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        
        var cluesText = ""
        for clue in poi.clues {
            cluesText += "• \(clue)\n"
        }
        cluesTextView.text = cluesText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }

}
