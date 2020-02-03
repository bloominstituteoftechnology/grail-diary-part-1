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
        
        var clue1 = ""
        var clue2 = ""
        var clue3 = ""
        
        if let clueItem: String = randomPOI.clues[0] {
            clue1 = clueItem
        }
        if let clueItem: String = randomPOI.clues[1] {
            clue2 = clueItem
        }
        if let clueItem: String = randomPOI.clues[2] {
            clue3 = clueItem
        }
        
        
        locationLabel.text = randomPOI.location
        countryLabel.text = randomPOI.country
        cluesTextView.text =
        """
        \(clue1)
        \(clue2)
        \(clue3)
        """
        
        
        
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
