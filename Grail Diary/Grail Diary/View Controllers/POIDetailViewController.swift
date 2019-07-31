//
//  CluesDetailViewController.swift
//  Grail Diary
//
//  Created by Jessie Ann Griffin on 7/28/19.
//  Copyright © 2019 Jessie Griffin. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateviews()
        
    }
    
    private func updateviews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
//        cluesTextView.text = "• \(poi.clues[0])\n• \(poi.clues[1])\n• \(poi.clues[2])"
        var listOfClues: String = ""
        
        for clue in poi.clues {
            listOfClues += "• \(clue)\n"
            
        }
        cluesTextView.text = listOfClues
    }

}
