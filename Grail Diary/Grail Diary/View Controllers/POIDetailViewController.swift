//
//  POIDetailViewController.swift
//  Grail Diary
//
//  Created by brian vilchez on 7/17/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    var poi: POI?
    
    func updateViews() {
        if let poi = poi {
            locationNameLabel.text = poi.location
            countryLabel.text = poi.Country
            cluesTextView.text = "\(poi.clues) \n"
        }
    }
}
