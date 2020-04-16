//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Enzo Jimenez-Soto on 4/16/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var delegate: AddPOIDelegate?
    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {

        guard isViewLoaded else { return }
        
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        
        var cluesText = ""
        
        for clue in poi.clues {
            cluesText += "- \(clue)\n"
        }
        cluesTextView.text = cluesText
    }
}


