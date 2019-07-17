//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Bradley Yin on 7/17/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    var poi : POI?
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()

        // Do any additional setup after loading the view.
    }
    private func updateView(){
        guard let poi = poi else{return}
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        var cluesText = ""
        for clue in poi.clues{
            let clueString = "∙\(clue) \n"
            cluesText += clueString
        }
        cluesTextview.text = cluesText
    }
    

  

}
