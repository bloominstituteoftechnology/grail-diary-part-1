//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Lambda_School_Loaner_259 on 2/6/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var cluesTextView: UITextView!
    
    // MARK: Properties
    var poi: POI?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    private func updateViews() {
        var text = ""
        guard let poi = poi else { return }
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        for i in 0..<poi.clues.count {
            text = text + "Clue \(i+1): \(poi.clues[i])\n"
        }
        cluesTextView.text = text
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
