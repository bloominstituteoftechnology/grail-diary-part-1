//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Enrique Gongora on 1/23/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    private func updateViews() {
        guard let unwrappedPOI = poi else { return }
        locationLabel.text = unwrappedPOI.location
        countryLabel.text = unwrappedPOI.country
        
        var clueTextList = ""
        for clue in unwrappedPOI.clues{
            clueTextList += clue
        }
        cluesTextView.text = clueTextList
    }
    
    
}
