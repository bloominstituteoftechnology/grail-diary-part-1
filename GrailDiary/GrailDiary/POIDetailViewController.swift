//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Dennis Rudolph on 10/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
   
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesListTextView: UILabel!
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        var clueText = ""
        for clue in poi.clues {
            clueText += "\(clue)\n"
        }
        cluesListTextView.text = clueText
    }

}
