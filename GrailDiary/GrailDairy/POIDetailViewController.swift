//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Michael on 12/12/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var pointOfInterest: POI? {
        didSet {
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        guard isViewLoaded else { return }
        
        guard let poi = pointOfInterest else { return }
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        var cluesText = ""
        
        for clue in poi.clues {
            cluesText += "\(clue)\n"
            
            cluesTextView.text = cluesText
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
