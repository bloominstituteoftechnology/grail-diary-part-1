//
//  POIDetailViewController.swift
//  Grail Diary
//
//  Created by macbook on 9/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI?

    
    //ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
    // private func updateViews
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
