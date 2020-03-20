//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Dahna on 3/19/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

import UIKit


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
        if let unwrappedPOI = poi {
            print("should print poi")
            print(unwrappedPOI)
            locationLabel.text = unwrappedPOI.location
            countryLabel.text = unwrappedPOI.country
            var clueString: String = ""
            for clue in unwrappedPOI.clues {
                clueString.append(clue + "\n")
            }
            cluesTextView.text = clueString

        }
    }

}
