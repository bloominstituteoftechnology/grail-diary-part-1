//
//  ViewController.swift
//  GrailDairy
//
//  Created by Sam Gutierrez on 5/22/20.
//  Copyright © 2020 Sam Gutierrez.inc. All rights reserved.
//

import UIKit

class POITableViewController: UIViewController {

    var pointsOfInterest: [PointOfInterest] = []
    
    let newPOI = PointOfInterest(location: "Los Angeles", country: "USA", clues: ["Has 50 States"])
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

