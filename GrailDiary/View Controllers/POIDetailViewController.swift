//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Matthew Martindale on 2/5/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI?
    
    private func updateViews() {
        var cluesStr = ""
        guard let location = poi?.location,
        let country = poi?.country,
        let clues = poi?.clues else { return }
            locationLabel.text = location
            countryLabel.text = country
        for clue in clues {
            cluesStr += "• \(clue)\n"
        }
            cluesTextView.text = cluesStr
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

