//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Jorge Alvarez on 12/12/19.
//  Copyright © 2019 Jorge Alvarez. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var delegate: AddPOIDelegate?
    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    func updateViews() {

        // Make sure the view controller has had time to set up the outlets, if not stop the function
        guard isViewLoaded else {return}
        
        guard let poi = poi else {return}
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        
        // This is the string that we will give to the text view's text
        var cluesText = ""
        
        for clue in poi.clues {
            cluesText += "- \(clue)\n" // \n is new line
        }
        
        cluesTextView.text = cluesText
        
    }


}
