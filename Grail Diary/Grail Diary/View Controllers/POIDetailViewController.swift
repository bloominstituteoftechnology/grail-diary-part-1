//
//  POIDetailViewController.swift
//  Grail Diary
//
//  Created by Joel Groomer on 7/30/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var txtvClues: UITextView!
    
    var poi: POI?
    
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

    private func updateViews() {
        guard let poi = poi else { return }
        
        lblLocation.text = poi.location
        lblCountry.text = poi.country
        
        var clues = ""
        var cluenum = 1
        for c in poi.clues {
            clues += "* Clue \(cluenum): \(c)\n\n"
            cluenum += 1
        }
        txtvClues.text = clues
    }
}
