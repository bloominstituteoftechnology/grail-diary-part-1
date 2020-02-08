//
//  AddPOIViewController.swift
//  GrailDairy
//
//  Created by LambdaSchoolVM_Catalina on 11/21/19.
//  Copyright © 2019 sierra. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {

    @IBOutlet weak var locationLbl: UITextField!
    @IBOutlet weak var countryLbl: UITextField!
    @IBOutlet weak var clue1Lbl: UITextField!
    @IBOutlet weak var clue2Lbl: UITextField!
    @IBOutlet weak var clue3Lbl: UITextField!
    
    var delegate: AddPOIDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
       dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = locationLbl.text,
            let country = countryLbl.text,
            !location.isEmpty,
            !country.isEmpty else { return }
        
        var poi = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1Lbl.text,
            !clue1.isEmpty {
            poi.clues.append(clue1)
        }
        
        if let clue2 = clue2Lbl.text,
            !clue2.isEmpty {
            poi.clues.append(clue2)
        }
        
        if let clue3 = clue3Lbl.text,
            !clue3.isEmpty {
            poi.clues.append(clue3)
        }
        delegate?.poiWasAdded(poi)
        dismiss(animated: true, completion: nil)
    }

}
//Implement the delegate method textFieldShouldReturn(_:); unwrap the text and make sure it's not empty, then switch off the textfield to determine which one called this method; change the firstResponder status to the appropriate textfield = What?
extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text,
            !text.isEmpty else { return false }

        switch textField {

            case locationLbl:
                countryLbl.becomeFirstResponder()

            case countryLbl:
                clue1Lbl.becomeFirstResponder()

            case clue1Lbl:
                clue2Lbl.becomeFirstResponder()

            case clue2Lbl:
                clue3Lbl.becomeFirstResponder()

            default:
                textField.resignFirstResponder()
            }

        return false
    }
}
