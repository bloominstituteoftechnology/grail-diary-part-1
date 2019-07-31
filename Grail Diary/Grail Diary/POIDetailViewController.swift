//
//  POIDetailViewController.swift
//  Grail Diary
//
//  Created by Thomas Dye on 07/29/2019.
//  Copyright © 2019 Thomas Dye. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var cluesText: UITextView!
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
        
    private func updateViews() {
        
        guard let poi = poi else { return }
        
        cityLabel.text = poi.city
        stateLabel.text = poi.state
        countryLabel.text = poi.country
        title = cityLabel.text
        var index = 1
        for clue in poi.clues {
            cluesText.text += "\tClue \(index). \(clue)\n"
            index += 1
        }
    }
}
