//
//  POIDetailViewController.swift
//  GrailDairy
//
//  Created by alfredo on 11/24/19.
//  Copyright © 2019 alfredo. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    //34. Declare 3 `IBOutlet` properties: `locationLabel`, `countryLabel`, and `cluesTextView` using `UILabel` and `UITextView` for the types; wire them to their appropriate subviews in the storyboard
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    //    35. Declare a variable property called `poi` of type `POI`
        var poi: POI?
        //36. Create a private method called `updateViews` that takes no arguments
        private func updateViews() {
            //38. In `updateViews`, unwrap the poi property with `guard` and set the various model properties to the text of the labels and the textview; you'll have to do a little formatting to show the clues as a list in the `cluesTextView`
            guard let poi = poi else { return }
            
            locationLabel.text = poi.location
            countryLabel.text = poi.country
            var cluesText = ""
            for clue in poi.clues {
                cluesText += "•  \(clue)\n"
            }
            
            cluesTextView.text = cluesText
            
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            //37. Call the above method inside `viewDidLoad`
            updateViews()
        }

}
