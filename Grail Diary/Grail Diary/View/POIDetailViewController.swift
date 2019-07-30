//
//  POIDetailViewController.swift
//  Grail Diary
//
//  Created by Joseph Rogers on 7/29/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var mypoi: POI?
  
    private func updateViews(){
        guard let updatepoi = mypoi else {return}
        mypoi?.location = updatepoi.location
        mypoi?.country = updatepoi.country
        mypoi?.clues = ["\(updatepoi.clues.count) clues\n \(updatepoi.clues.indices[0])\n"]
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
