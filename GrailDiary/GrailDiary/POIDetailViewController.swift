//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Bradley Diroff on 2/20/20.
//  Copyright © 2020 Bradley Diroff. All rights reserved.
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
    }
    
    func updateViews() {
        guard let poi = poi else {return}
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
            
        let joined = poi.clues.joined(separator: ", ")
        
        cluesTextView.text = joined
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
