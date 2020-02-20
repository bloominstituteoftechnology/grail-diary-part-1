//
//  POIDetailViewController.swift
//  Diary
//
//  Created by Lydia Zhang on 2/20/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var clueTextView: UITextView!
    
    var poi: POI?
    func updateViews() {
        guard let poi = poi else {
            return
        }
        locationNameLabel.text = poi.location
        countryLabel.text = poi.country
        clueTextView.text = "\(poi.clue)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
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
