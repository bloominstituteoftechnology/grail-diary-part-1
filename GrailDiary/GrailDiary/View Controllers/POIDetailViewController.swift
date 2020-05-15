//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Richard Gibbs on 5/14/20.
//  Copyright © 2020 Rich Gibbs. All rights reserved.
//

import UIKit



class POIDetailViewController: UIViewController {

    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI?
    
    private func updateViews() {
        guard let _ = locationLabel.text,
            let _ = countryLabel.text,
            let _ = cluesTextView.text  else { return }
        
        
        }
        
    
    
    
    override func viewDidLoad() {
        updateViews()
        super.viewDidLoad()

        if let poi = poi {
           self.locationLabel.text = poi.location
           self.countryLabel.text = poi.country
           self.cluesTextView.text = poi.clues.joined(separator: ". ")
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
