//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Chad Rutherford on 11/7/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Outlets
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    var point: POI?
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    /// Private function utilized to set up the display and layout of model information within the ViewController
    private func updateViews() {
        cluesTextView.text = ""
        guard let point = point else { return }
        locationLabel.text = point.location
        countryLabel.text = point.country
        for clue in point.clues {
            cluesTextView.text += "•\(clue)\n"
        }
    }
}
