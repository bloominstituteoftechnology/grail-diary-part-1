//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Shawn James on 3/19/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    // MARK: - Properties
    var poi: POI?
    
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateViews()
    }
    
    private func updateViews() {
        guard let unwrappedPoi = poi else { return }
        locationLabel.text = unwrappedPoi.location
        countryLabel.text = unwrappedPoi.country
        cluesTextView.text = """
        Clue 1: \(unwrappedPoi.clues[0])
        Clue 2: \(unwrappedPoi.clues[1])
        Clue 3: \(unwrappedPoi.clues[2])
        """
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
