//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Chad Parker on 2/6/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
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
        guard let poi = poi else { return }
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        var clueText = ""
        for clue in poi.clues {
            clueText.append("\(clue)\n")
        }
        cluesTextView.text = clueText
    }
}
