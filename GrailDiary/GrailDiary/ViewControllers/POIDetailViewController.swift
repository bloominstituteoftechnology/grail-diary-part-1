//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Marissa Gonzales on 4/15/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

import UIKit
@IBDesignable
class POIDetailViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    private func updateViews() {
        
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        
        var cluesText: String = ""
        
        for clues in poi.clues {
            
            cluesText += "\(clues)"
        }
        
        cluesTextView.text = cluesText
    }
}
