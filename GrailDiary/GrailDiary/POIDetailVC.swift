//
//  POIDetailVC.swift
//  GrailDiary
//
//  Created by Norlan Tibanear on 5/27/20.
//  Copyright © 2020 Norlan Tibanear. All rights reserved.
//

import UIKit

class POIDetailVC: UIViewController {
    
    // Outlets
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var cluesTextView: UITextView!
    @IBOutlet var imageView: UIImageView!
    
    
    var poi: POI?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        
        updateViews()
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        
        var cluesLabel = ""
        for clues in poi.clues {
            cluesLabel += ". \(clues)\n"
        }
        cluesTextView.text = cluesLabel
    }
    
    
    
    
    
    

 

} // END
