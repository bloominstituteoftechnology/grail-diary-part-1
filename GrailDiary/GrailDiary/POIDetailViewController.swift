//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Chris Dobek on 3/19/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    
    var poi: POI?
        
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
