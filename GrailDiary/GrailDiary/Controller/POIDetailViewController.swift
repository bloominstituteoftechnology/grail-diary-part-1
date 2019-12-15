//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Lambda_School_loaner_226 on 12/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UILabel!
    
    var poi: POI?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        updateViews()
    }
    
    private func updateViews()
    {
        guard let poi = poi else {return}
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesTextView.text = String(poi.clues.count)
    }
    
    
    
    
    
    
    
    
    
    
}
