//
//  POIDetailViewController.swift
//  GrailDairy
//
//  Created by Waseem Idelbi on 11/21/19.
//  Copyright © 2019 Waseem Idelbi. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var cluesTextView: UITextView!
    
    var poi: POI?
    
    private func updateViews() {
        guard let randomPOI = poi else {return}
        var cluesString = ""
        for clue in randomPOI.clues {
            cluesString += " \(clue) \n"
        }
        
        locationLabel.text = randomPOI.location
        countryLabel.text = randomPOI.country
        cluesTextView.text = cluesString
        
        
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
