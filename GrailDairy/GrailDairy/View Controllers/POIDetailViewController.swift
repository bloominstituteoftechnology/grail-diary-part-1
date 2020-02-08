//
//  POIDetailViewController.swift
//  GrailDairy
//
//  Created by LambdaSchoolVM_Catalina on 11/21/19.
//  Copyright © 2019 sierra. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var cluesTxtView: UITextView!
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        countryLbl.text = poi.country
        locationLbl.text = poi.location
        var cluesTxt = ""
        for clues in poi.clues {
            cluesTxt = "* \(clues)\n"
        }
        cluesTxtView.text = cluesTxt
    }
    
}

    
