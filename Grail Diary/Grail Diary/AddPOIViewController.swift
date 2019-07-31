//
//  AddPOIViewController.swift
//  Grail Diary
//
//  Created by Thomas Dye on 07/29/2019.
//  Copyright © 2019 Thomas Dye. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {

    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clueOneTextField: UITextField!
    @IBOutlet weak var clueTwoTextField: UITextField!
    @IBOutlet weak var clueThreeTextField: UITextField!
    
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        
        guard let city = cityTextField.text,
            let state = stateTextField.text,
            let country = countryTextField.text,
            !city.isEmpty,
            !state.isEmpty,
            !country.isEmpty else { return }
        
        var poi = POI(city: city, state: state, country: country, clues: [])
        
        if let clue1 = clueOneTextField.text, !clue1.isEmpty {
            poi.clues.append(clue1)
        }
        
        if let clue2 = clueTwoTextField.text, !clue2.isEmpty {
            poi.clues.append(clue2)
        }
        
        if let clue3 = clueThreeTextField.text, !clue3.isEmpty {
            poi.clues.append(clue3)
        }
        
        delegate?.poiWasAdded(poi)
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

extension AddPOIViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let firstResponder = textField.text, !firstResponder.isEmpty {
            switch textField {
            case cityTextField:
                stateTextField.becomeFirstResponder()
            case stateTextField:
                countryTextField.becomeFirstResponder()
            case countryTextField:
                clueOneTextField.becomeFirstResponder()
            case clueOneTextField:
                clueTwoTextField.becomeFirstResponder()
            case clueTwoTextField:
                clueThreeTextField.becomeFirstResponder()
            default:
                cityTextField.becomeFirstResponder()
            }
        }
        
        return false
    }
}
