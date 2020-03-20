//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Marissa Gonzales on 3/19/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

import UIKit




class POIDetailViewController: UIViewController {
    
   var poi: POI?
   
    // Objects
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    private func updateViews() {
        guard let _ = locationLabel.text,
            
            let _ = countryLabel.text,
            
            let _ = cluesTextView.text else {
                
            return
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

