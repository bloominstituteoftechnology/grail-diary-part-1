//
//  POIDetailViewController.swift
//  Grail Diary
//
//  Created by Joseph Rogers on 7/29/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    //MARK: step 34 -38
    //Declared the labels and text view. Added an optional variable of type POI. created the update views function for this page that passes all the data to the labels. had view did load updateViews within the detail view controller
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
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
            clueText += "∙ \(clue)\n"
        }
        
        cluesTextView.text = clueText
    }
}

