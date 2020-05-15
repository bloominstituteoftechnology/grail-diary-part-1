//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Percy Ngan on 7/19/19.
//  Copyright © 2019 Lamdba School. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func POICreated(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clueTextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    var delegate: AddPOIDelegate? 
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = locationTextField.text,
            let country = countryTextField.text,
            !location.isEmpty,
            !country.isEmpty else { return }
        
        
        var poi = POI(location: location, country: country, clues: [])
        
        if let clue = clueTextField.text,
            !clue.isEmpty {
            poi.clues.append(clue)
        }
        
        if let clue2 = clue2TextField.text,
            !clue2.isEmpty {
            poi.clues.append(clue2)
        }
        
        if let clue3 = clue3TextField.text,
            !clue3.isEmpty {
            poi.clues.append(clue3)
        }
        
        delegate?.POICreated(poi)
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        locationTextField.resignFirstResponder()
        countryTextField.resignFirstResponder()
        clueTextField.resignFirstResponder()
        clue2TextField.resignFirstResponder()
        clue3TextField.resignFirstResponder()
    }
}

extension AddPOIViewController: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text,
            !text.isEmpty {
            switch textField {
            case locationTextField:
                countryTextField.becomeFirstResponder()
            case countryTextField:
                clueTextField.becomeFirstResponder()
            case clueTextField:
                clue2TextField.becomeFirstResponder()
            case clue2TextField:
                clue3TextField.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
            }
        }
        
        return false
    }
}
