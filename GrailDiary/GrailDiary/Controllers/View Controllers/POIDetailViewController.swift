//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Nonye on 4/16/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import UIKit

@IBDesignable
class POIDetailViewController: UIViewController {

    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var clueTextView: UITextView!
    var poi: POI?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        var cluesInText = ""
        for clue in poi.clues {
            cluesInText += "\(clue)"
        }
        clueTextView.text = cluesInText
    }

}
