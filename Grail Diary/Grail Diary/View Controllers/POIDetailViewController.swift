//
//  POIDetailViewController.swift
//  Grail Diary
//
//  Created by Niranjan Kumar on 10/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextField: UITextView!
    
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

    }
    
    private func updateViews() {
        
        guard let poi = poi else { return }
        
        locationNameLabel.text = poi.location
        countryLabel.text = poi.country
        var cluesText = ""
        for clues in poi.clues {
            cluesText += "\(clues)\n"
        }
        
        cluesTextField.text = cluesText
        
    }
}
