//
//  POIDetailViewController.swift
//  Grail-Diary
//
//  Created by Breena Greek on 2/5/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    // MARK: IBOutlets
    
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI?
    
    private func updateViews() {
        guard let poi = poi else { return }
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        for i in 0..<poi.clues.count {
            cluesTextView.text = 
                    

            }
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


