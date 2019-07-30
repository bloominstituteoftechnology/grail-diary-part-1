//
//  POIDetailViewController.swift
//  Grail Diary
//
//  Created by Joseph Rogers on 7/29/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var mypoi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    private func updateViews() {
        guard let poi = mypoi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        var clueText = ""
        for clue in poi.clues {
            clueText += "∙ \(clue)\n"
        }
        
        cluesTextView.text = clueText
    }
    
}

