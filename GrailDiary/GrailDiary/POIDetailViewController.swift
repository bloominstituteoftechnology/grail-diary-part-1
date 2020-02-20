//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Mark Gerrior on 2/20/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    @IBOutlet weak var countryLabel: UILabel!
    
    var poi: POI?
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        
        var cluesText = ""
        for clue in poi.clues {
            cluesText += clue + "\r"
        }
        
        cluesTextView.text = cluesText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateViews()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
