//
//  POIDetailViewController.swift
//  grail-diary-part-1
//
//  Created by Samuel Esserman on 2/18/20.
//  Copyright © 2020 Samuel Esserman. All rights reserved.
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
        updateView()
    }
    
    private func updateView() {
        guard let poi = poi else { return }
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        var clueString = ""
        for clue in poi.clues {
            clueString += clue
            clueString += "\n"
        }
        cluesTextView.text = clueString
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
