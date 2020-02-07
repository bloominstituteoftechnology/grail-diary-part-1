//
//  POIDetailViewController.swift
//  GrailDairy
//
//  Created by Juan M Mariscal on 2/5/20.
//  Copyright © 2020 Juan M Mariscal. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI?
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesTextView.text = "Clue 1: \(poi.clues[0])\nClue 2: \(poi.clues[1])\nClue 3: \(poi.clues[2])"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
        
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
