//
//  POIDetailViewController.swift
//  Grail Diary
//
//  Created by Lambda_School_Loaner_101 on 7/30/19.
//  Copyright © 2019 Ife Banire. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    
    func updateViews() {
        guard let poi = poi else { return }
        
        locationNameLabel.text = poi.location
        countryLabel.text = poi.country
//        cluesTextView.text =
    }

}
