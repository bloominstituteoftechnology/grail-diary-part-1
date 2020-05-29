//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by James Sedlacek on 5/27/20.
//  Copyright © 2020 James Sedlacek. All rights reserved.
//

import UIKit

protocol addPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {

    @IBOutlet weak var LocationTextField: UITextField!
    @IBOutlet weak var CountryTextField: UITextField!
    @IBOutlet weak var Clue1TextField: UITextField!
    @IBOutlet weak var Clue2TextField: UITextField!
    @IBOutlet weak var Clue3TextField: UITextField!
    
    var delegate: addPOIDelegate?
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = LocationTextField.text,
            let country = CountryTextField.text,
            !location.isEmpty,
            !country.isEmpty else { return }
        
        var poi = POI(location: location, country: country, clues: [])
        
        if let clue1 = Clue1TextField.text, !clue1.isEmpty {
            poi.clues.append(clue1)
        }
        
        if let clue2 = Clue2TextField.text, !clue2.isEmpty {
            poi.clues.append(clue2)
        }
        
        if let clue3 = Clue3TextField.text, !clue3.isEmpty {
            poi.clues.append(clue3)
        }
        
        delegate?.poiWasAdded(poi)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LocationTextField.delegate = self
    }
}

//when you press "Return" it jumps to the next Textfield
extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            switch textField {
            case LocationTextField:
                CountryTextField.becomeFirstResponder()
            case CountryTextField:
                Clue1TextField.becomeFirstResponder()
            case Clue1TextField:
                Clue2TextField.becomeFirstResponder()
            case Clue2TextField:
                Clue3TextField.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
            }
        }
        return false
    }
}
