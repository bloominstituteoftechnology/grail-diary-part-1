//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Aaron Cleveland on 12/12/19.
//  Copyright © 2019 Aaron Cleveland. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {

    @IBOutlet weak var locationLabel: UITextField!
    @IBOutlet weak var countryLabel: UITextField!
    @IBOutlet weak var clue1Label: UITextField!
    @IBOutlet weak var clue2Label: UITextField!
    @IBOutlet weak var clue3Label: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        
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
