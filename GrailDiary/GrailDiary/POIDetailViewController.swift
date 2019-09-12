//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Niranjan Kumar on 9/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var clueTextView: UITextView!
    
    
    var poi: POI?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

    }
    
    private func updateViews () {
        
    
    guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        var clueText = ""
        for clues in poi.clues {
            clueText += "\(clues) "
        }
        
        clueTextView.text = clueText
    
    }


}
