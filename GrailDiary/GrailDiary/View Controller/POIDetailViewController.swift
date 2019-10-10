//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Lambda_School_Loaner_204 on 10/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
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
        // Do any additional setup after loading the view.
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        var cluesText = ""
        var clueNumber = 1
        for clue in poi.clues {
            cluesText += "Clue \(clueNumber): \(clue)\n"
            clueNumber += 1
        }
        cluesTextView.text = cluesText
    }

}
