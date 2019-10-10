//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Jon Bash on 2019-10-10.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import UIKit

protocol POIDetailDelegate {
    func detailViewWasDismissed()
}

class POIDetailViewController: UIViewController {
    
    var delegate: POIDetailDelegate?
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        delegate?.detailViewWasDismissed()
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesTextView.text = {
            var cluesText = ""
            for clue in poi.clues {
                cluesText += "• \(clue)\n"
            }
            return cluesText
        }()
    }
}
