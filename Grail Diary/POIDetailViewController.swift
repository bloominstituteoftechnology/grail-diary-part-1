//
//  POIDetailViewController.swift
//  Grail Diary
//
//  Created by William Chen on 8/14/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    @IBOutlet weak var locationName: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
  
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    private func updateViews(){
        guard let poi = poi else {return}
        
        locationName.text = poi.location
        countryLabel.text = poi.country
        var cluesText = ""
        for clue in poi.clues{
            cluesText += "• \(clue)\n"
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

}
