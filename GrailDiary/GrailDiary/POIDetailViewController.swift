//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Craig Swanson on 9/25/19.
//  Copyright © 2019 Craig Swanson. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    private func updateViews() {
        guard let poi = poi, isViewLoaded else {return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        
        var clueText = ""
        for clue in poi.clues {
            clueText += "• \(clue)\n"
        }
        cluesTextView.text = clueText
    }


}
