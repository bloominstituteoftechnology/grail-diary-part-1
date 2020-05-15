//
//  POIDetailViewController.swift
//  grail-diary-part-1
//
//  Created by Aaron on 7/30/19.
//  Copyright © 2019 AlphaGrade, INC. All rights reserved.
//

import UIKit


class POIDetailViewController: UIViewController {
    
    @IBOutlet weak var cluesTextView: UITextView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var poi: POI? {
        didSet {
           
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - For Loop for appending Clues to Textfield.
    private func updateViews() {
        guard let clues = poi?.clues, !clues.isEmpty else { return }
        cluesTextView.text = ""
        for clue in clues {
            if let clue = clue {
            cluesTextView.text.append(String("\n \(clue)"))
            }
        }
      

        guard let poi = poi else { return }
        
       
        countryLabel.text = poi.country
        locationLabel.text = poi.location
        
    }
    
    

    
}
