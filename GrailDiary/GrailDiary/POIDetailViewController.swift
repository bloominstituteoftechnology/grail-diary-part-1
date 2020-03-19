//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Mark Poggi on 3/19/20.
//  Copyright © 2020 Mark Poggi. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesLabel: UILabel!
    
    var poi: POI?
    
    private func updateViews() {
        guard let newDetail = poi else { return }
        locationLabel.text = newDetail.location
        countryLabel.text  = newDetail.country
        cluesLabel.text = "\(newDetail.clues)"
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()

       
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
