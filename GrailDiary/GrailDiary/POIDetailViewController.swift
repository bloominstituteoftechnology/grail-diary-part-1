//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Hunter Oppel on 3/19/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    var poi: POI?
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateViews()
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        var clueText: String = ""
        for clue in poi.clues {
            clueText += "- \(clue)\n"
        }
        cluesTextView.text = clueText
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
