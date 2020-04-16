//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Marissa Gonzales on 4/15/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var cluesTextView: UITextView!
    
    private func updateViews() {
        
        guard let location = locationLabel.text,
                 let country = countryLabel.text else { return }
             
             locationLabel.text = location
             countryLabel.text = country
    }




    override func viewDidLoad() {
        super.viewDidLoad()
        
       
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
