//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Kenny on 12/11/19.
//  Copyright © 2019 Hazy Studios. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    var poi: POI?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    private func updateViews() {
//        In updateViews, unwrap the poi property with guard and set the various model properties to the text of the labels and the textview; you'll have to do a little formatting to show the clues as a list in the cluesTextView
        cluesTextView.text = ""
        guard let poi = poi else {return}
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        var cluesText = ""
        for clue in poi.clues {
            cluesText += "\(clue)\n\n"
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
