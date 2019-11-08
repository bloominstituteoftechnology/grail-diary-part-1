//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Donella Barcelo on 11/7/19.
//  Copyright © 2019 Donella Barcelo. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesListTextView: UITextView!
    
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
            cluesText += "• \(clue)\n"
        }
        cluesListTextView.text = cluesText
    }
}
