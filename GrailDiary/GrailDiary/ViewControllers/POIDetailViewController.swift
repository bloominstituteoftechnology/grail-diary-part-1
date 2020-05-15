//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Percy Ngan on 7/19/19.
//  Copyright © 2019 Lamdba School. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var clueListText: UITextView!
    
    var poi1: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
    private func updateViews() {
        guard let poi1 = poi1 else { return }
        
        locationLabel.text = poi1.location
        countryLabel.text = poi1.country
        var clueText = ""
        for clue in poi1.clues {
            clueText += "∙ \(clue)\n"
        }
        
        clueListText.text = clueText
    }


}
