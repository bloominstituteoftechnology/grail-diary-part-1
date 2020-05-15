//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Mike Nichols on 5/14/20.
//  Copyright © 2020 Mike Nichols. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI
    
    private func updateViews() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews() {
            guard let poi = poi else {
                
            }
            
            locationLabel.text = poi.location
            countryLabel.text = poi.country
            cluesTextView.text = poi.clues
            
            
        }

        // Do any additional setup after loading the view.
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
