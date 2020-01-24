//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Chris Gonzales on 1/23/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

import UIKit

protocol AddPOIDelegate{
    func poiWasAdded(_ poi: POI)
}


class AddPOIViewController: UIViewController {

    var delegate: AddPOIDelegate?
    
    @IBOutlet weak var LocationTextField: UITextField!
    @IBOutlet weak var CountryTextField: UITextField!
    @IBOutlet weak var Clue1TextField: UITextField!
    @IBOutlet weak var Clue2TextField: UITextField!
    @IBOutlet weak var Clue3TextField: UITextField!
    
    @IBAction func CancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func SaveTapped(_ sender: UIBarButtonItem) {
        
        guard let locationText = LocationTextField.text,
            let countryText = CountryTextField.text else {return}
        var clues: [String] = []
        
        if let clue1 = Clue1TextField.text{
            clues.append(clue1)
        }
        if let clue2 = Clue2TextField.text{
            clues.append(clue2)
        }
        if let clue3 = Clue3TextField.text{
            clues.append(clue3)
        }
        let poi = POI(location: locationText, country: countryText, clues: clues)
        
        delegate?.poiWasAdded(poi)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AddPOIViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            switch textField {
            case LocationTextField:
                return LocationTextField.isFirstResponder
            case CountryTextField:
                return CountryTextField.isFirstResponder
            case Clue1TextField:
                return Clue1TextField.isFirstResponder
            case Clue2TextField:
                return Clue2TextField.isFirstResponder
            case Clue3TextField:
                return Clue3TextField.isFirstResponder
            default:
                return false
            }
    }
}
