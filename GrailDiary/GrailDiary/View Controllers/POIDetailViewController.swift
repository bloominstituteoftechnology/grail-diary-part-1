//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Robert on 2/5/20.
//  Copyright © 2020 Robs Creations. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
// Mark: IBOutlet
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    private func updateViews() {
           guard let poi = poi else { return }
           locationLabel.text = poi.location
           countryLabel.text = poi.country
            var cluesText = ""
        for clue in poi.clues {
            cluesText += ".\(clue)"
        }
        cluesTextView.text = cluesText
    }
   

}

