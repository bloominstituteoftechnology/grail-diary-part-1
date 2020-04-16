//
//  POIDataViewController.swift
//  GrailDiary
//
//  Created by Vincent Hoang on 4/16/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var cluesTextView: UITextView!
    
    var poi: POI?
    


    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    private func updateViews() {
        guard let unwrappedPOI = poi else {
            fatalError("POI object is null")
        }
        
        locationLabel.text = unwrappedPOI.location
        countryLabel.text = unwrappedPOI.country
        
        var cluesString = ""
        
        for clue in unwrappedPOI.clues {
            cluesString += "\(clue)\n"
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
