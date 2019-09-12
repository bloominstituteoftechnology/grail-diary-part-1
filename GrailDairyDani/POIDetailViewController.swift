//
//  POIDetailViewController.swift
//  GrailDairyDani
//
//  Created by Danielle Blackwell on 8/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var GrailListTextView: UITextView!
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    private func  updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryNameLabel.text = poi.country
        var clueText = ""
        for clue in poi.clues {
            clueText += "• \(clue)\n"
        }
//        apply the text to the object from the created function. 
        GrailListTextView.text = clueText
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

