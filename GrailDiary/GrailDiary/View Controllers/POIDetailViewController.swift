//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by David Wright on 11/21/19.
//  Copyright © 2019 David Wright. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var cluesTextView: UITextView!
    
    // MARK: - IBOutlets
    var poi: POI?
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        
        if poi.clues.isEmpty {
            cluesTextView.text = "none"
        } else {
            var clueCount = 0
            var clues = ""
            
            for clue in poi.clues {
                clueCount += 1
                clues += "\(clueCount). \(clue)"
                if clueCount < poi.clues.count {
                    clues += "\n\n"
                }
            }
            cluesTextView.text = clues
        }
        
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
