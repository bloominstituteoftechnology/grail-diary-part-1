//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Morgan Smith on 11/21/19.
//  Copyright © 2019 Morgan Smith. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var clueListTextView: UITextView!
    
    var thePOI: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    
    }
    
    private func updateViews() {
        guard let thePOI = thePOI else { return }
        
        locationLabel.text = thePOI.location
        countryLabel.text = thePOI.country
        var clueText = ""
        for clue in thePOI.clues {
            clueText += "∙ \(clue)\n"
        }
        
        clueListTextView.text = clueText
    }
}
