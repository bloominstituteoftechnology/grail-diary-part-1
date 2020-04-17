//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Aaron Peterson on 4/16/20.
//  Copyright © 2020 Aaron Peterson. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var cluesTextView: UILabel!
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        updateViews()
    }
    
    private func updateViews() {
        guard let poi = self.poi else { return }
        
        countryLabel.text = poi.country
        locationLabel.text = poi.location
        
        cluesTextView.text = poi.clues.joined(separator: ", ")
    }
    

}
