//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by John McCants on 5/19/20.
//  Copyright © 2020 John McCants. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi : POI?
    override func viewDidLoad() {
        updateViews()
     
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   private func updateViews() {
        guard let poi = poi else { return }
        print("update views in POIDetailViewController is working")
        locationName.text = poi.location
        countryName.text = poi.country
        var cluesText = ""
        for clue in poi.clues {
            cluesText += "∙ \(clue)\n"
        }
        cluesTextView.text = cluesText
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
