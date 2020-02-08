//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Aaron Cleveland on 12/12/19.
//  Copyright © 2019 Aaron Cleveland. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }

    func updateViews() {
        guard isViewLoaded else { return }
        
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        
        var clueText = ""
        for clue in poi.clues {
            clueText += "\(clue)\n"
        }
        
        cluesTextView.text = clueText
    }

}
