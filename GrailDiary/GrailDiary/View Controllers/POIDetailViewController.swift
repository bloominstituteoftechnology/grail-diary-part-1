//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Elizabeth Thomas on 2/5/20.
//  Copyright © 2020 Libby Thomas. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var cluesTextView: UITextView!
    
    var poi: POI?
    
    private func updateViews() {
        guard let poi = poi else { return }
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        for i in 0..<poi.clues.count {
            cluesTextView.text = cluesTextView.text + "\(i+1). \(poi.clues[i])"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateViews()

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
