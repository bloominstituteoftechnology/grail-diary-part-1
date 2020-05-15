//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Bryan Cress on 5/14/20.
//  Copyright © 2020 Bryan Cress. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI?
    
    override func viewDidLoad() {
          super.viewDidLoad()
  
        func updateViews() {
            
            if let poi = poi {
                
                self.locationLabel.text = poi.location
                self.countryLabel.text = poi.country
                self.cluesTextView.text = poi.clues
            }
        }
     
        
//          var poi: POI?
//
//          private func updateViews() {
//              guard let location = locationLabel.text,
//                  let country = countryLabel.text else { return }
//
//              //            let clues = cluesTextView.text
//           var clues:
  

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
