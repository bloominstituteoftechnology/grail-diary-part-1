//
//  POIDetailViewController.swift
//  grail diary part 1
//
//  Created by brian vilchez on 8/14/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    //MARK: - properties
    @IBOutlet weak var countryLabel:UILabel!
    @IBOutlet weak var locationLabel:UILabel!
    @IBOutlet weak var cluesLabel:UILabel!
    @IBOutlet weak var cluesTextView:UITextView!
    
    var poi:POI? {
        didSet{
            updateViews()
        }
    }
    
    //MARK: - actions
    func updateViews() {
        guard let poi = poi else {return}
        countryLabel.text = poi.country
        locationLabel.text = poi.location
        cluesLabel.text = "#\(poi.clues.count) of clues"
        cluesTextView.text = "\(poi.clues)/n"
    }
    

}
