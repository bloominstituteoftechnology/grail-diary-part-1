//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Shawn Gee on 2/18/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

protocol AddPOIDelegate: AnyObject {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {

    weak var delegate: AddPOIDelegate?
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = locationTextField.text, let country = countryTextField.text else { return }
        
        var poi = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1TextField.text, !clue1.isEmpty {
            poi.clues.append(clue1)
        }
        if let clue2 = clue2TextField.text, !clue2.isEmpty {
            poi.clues.append(clue2)
        }
        if let clue3 = clue3TextField.text, !clue3.isEmpty {
            poi.clues.append(clue3)
        }
        
        delegate?.poiWasAdded(poi)
        dismiss(animated: true)
    }
}


//MARK: - UITextFieldDelegate

extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text, !text.isEmpty else {
            return false
        }
        
        let nextTextField: UITextField
        
        switch textField {
        case locationTextField:
            nextTextField = countryTextField
        case countryTextField:
            nextTextField = clue1TextField
        case clue1TextField:
            nextTextField = clue2TextField
        case clue2TextField:
            nextTextField = clue3TextField
        default:
            textField.resignFirstResponder()
            return true
        }
        
        nextTextField.becomeFirstResponder()
        return true
    }
}
