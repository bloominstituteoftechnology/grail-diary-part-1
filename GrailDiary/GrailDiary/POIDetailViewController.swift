//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Chris Gonzales on 1/23/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    
    @IBOutlet weak var LocationLabel: UILabel!
    
    @IBOutlet weak var CountryLabel: UILabel!
    
    @IBOutlet weak var CluesTextView: UITextView!
    
    var poi: POI?
    
    private func updateViews(){
        guard
            let unwrappedpoi = poi else { return}
        LocationLabel.text = unwrappedpoi.location
        CountryLabel.text = unwrappedpoi.country
        
        let clueText = unwrappedpoi.clues.joined(separator: "\n")
        CluesTextView.text = clueText
        
        
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
