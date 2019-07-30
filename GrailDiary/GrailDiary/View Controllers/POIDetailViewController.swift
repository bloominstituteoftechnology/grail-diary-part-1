//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Fabiola S on 7/29/19.
//  Copyright © 2019 Fabiola Saga. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesListTextView: UITextView!
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesListTextView.text = "\(poi.clues.joined(separator: "\n"))"
    }
}
