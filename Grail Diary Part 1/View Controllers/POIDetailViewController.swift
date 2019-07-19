//
//  POIDetailViewController.swift
//  Grail Diary Part 1
//
//  Created by Andrew Ruiz on 7/17/19.
//  Copyright © 2019 Andrew Ruiz. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var clueListTextView: UITextView!
    
    var poi: POI?


    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    

    private func updateViews() {
        guard let poi = poi else {return}
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        
        var clueText = ""
        
        for clue in poi.clues {
            clueText += "\(clue)\n"
        }
        
        clueListTextView.text = clueText
    }

}
