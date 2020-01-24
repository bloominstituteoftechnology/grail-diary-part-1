//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Lambda_School_Loaner_254 on 1/23/20.
//  Copyright © 2020 Rebecca Roshon. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
    
}

class AddPOIViewController: UIViewController {
    @IBOutlet weak var LocationLabel: UITextField!
    @IBOutlet weak var countryLabel: UITextField!
    @IBOutlet weak var clue2Label: UITextField!
    @IBOutlet weak var clue1Label: UITextField!
    @IBOutlet weak var clue3Label: UITextField!
    
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveTapped(_ sender: Any) {
        guard let country = countryLabel.text,
            let location = LocationLabel.text else {return}
            
            var clues: [String] = []
            
            if let clue1 = clue1Label.text,
                !clue1.isEmpty {
                clues.append(clue1)
            }
            if let clue2 = clue2Label.text,
                       !clue2.isEmpty {
                       clues.append(clue2)
            }
            if let clue3 = clue3Label.text,
                       !clue3.isEmpty {
                       clues.append(clue3)
            }
            
            // make a new friend
            
        let poi = POI(location: location, country: country, clues: clues)
            
            // add it to the array of friends in the table view controller
            // TVC is the delegate
            delegate?.poiWasAdded(_ : poi)
            
        }
    }
    
extension AddPOIDelegate: UITextFieldDelegate {
    
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


