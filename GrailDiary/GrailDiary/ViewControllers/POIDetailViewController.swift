//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Shawn Gee on 2/18/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI?
    
    override func viewDidLoad() {
        updateViews()
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesTextView.text = format(clues: poi.clues)
    }

    private func format(clues: [String]) -> String {
        var cluesText = ""
        for i in 0..<clues.count {
            if i > 0 {
                cluesText += "\n\n"
            }
            cluesText += "Clue #\(i + 1):\n"
            cluesText += clues[i]
        }
        return cluesText
    }
}
