//
//  AddPOIViewController.swift
//  GrailDairy
//
//  Created by Sam Gutierrez on 5/28/20.
//  Copyright © 2020 Sam Gutierrez.inc. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: PointOfInterest)
}

var delegate: AddPOIDelegate?

class AddPOIViewController: UIViewController {

    
    @IBOutlet weak var LocationTextLabel: UITextField!
    @IBOutlet weak var CountryTextLabel: UITextField!
    @IBOutlet weak var Clue1TextLabel: UITextField!
    @IBOutlet weak var Clue2TextLabel: UITextField!
    @IBOutlet weak var Clue3TextLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func CancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func SaveButtonTapped(_ sender: Any) {
        
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
