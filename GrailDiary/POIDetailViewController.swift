//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by scott harris on 1/23/20.
//  Copyright © 2020 scott harris. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateViews()
        
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        var cluesString = ""
        for clue in poi.clues {
            cluesString += clue
            cluesString += "\n"
        }
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
