//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Chad Rutherford on 11/7/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import UIKit

class AddPOIViewController: UIViewController {
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Outlets
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    weak var delegate: AddPOIDelegate?
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Actions
    /// Function called when the cancel button is tapped to allow the user to dismiss the view controller scene.
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    /// Function called when the save button is tapped to allow the user to create and save a new POI object.
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = locationTextField.text,
            let country = countryTextField.text,
            !location.isEmpty,
            !country.isEmpty else { return }
        
        var newPoint = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1TextField.text, !clue1.isEmpty {
            newPoint.clues.append(clue1)
        }
        
        if let clue2 = clue2TextField.text, !clue2.isEmpty {
            newPoint.clues.append(clue2)
        }
        
        if let clue3 = clue3TextField.text, !clue3.isEmpty {
            newPoint.clues.append(clue3)
        }
        
        delegate?.poiWasAdded(newPoint)
    }
}

// --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
// MARK: - TextField Delegate Extension
extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text, !text.isEmpty else { return false }
        switch textField {
        case locationTextField:
            countryTextField.becomeFirstResponder()
        case countryTextField:
            clue1TextField.becomeFirstResponder()
        case clue1TextField:
            clue2TextField.becomeFirstResponder()
        case clue2TextField:
            clue3TextField.becomeFirstResponder()
        case clue3TextField:
            textField.resignFirstResponder()
        default:
            break
        }
        return true
    }
}
