//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Jon Bash on 2019-10-10.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationTextField.becomeFirstResponder()
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        saveNewPOI()
    }
    
    private func saveNewPOI() {
        guard let location = locationTextField.text, !location.isEmpty,
            let country = countryTextField.text, !country.isEmpty
            else {
                showEmptyFieldAlert()
                return
        }
        
        var poi = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1TextField.text {
            poi.clues.append(clue1)
        }
        if let clue2 = clue2TextField.text {
            poi.clues.append(clue2)
        }
        if let clue3 = clue3TextField.text {
            poi.clues.append(clue3)
        }
        
        delegate?.poiWasAdded(poi)
    }
    
    private func showEmptyFieldAlert() {
        let emptyFieldAlert = UIAlertController(
            title: "Required field(s) empty!",
            message: "'Location' and 'country' fields must be non-empty.",
            preferredStyle: .alert
        )
        
        emptyFieldAlert.addAction(UIAlertAction(
            title: "OK",
            style: .cancel,
            handler: { (_: UIAlertAction) in
                self.locationTextField.becomeFirstResponder()
        }))
        
        present(emptyFieldAlert, animated: true, completion: nil)
    }
}

extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty,
            (textField == locationTextField || textField == countryTextField) {
                showEmptyFieldAlert()
                return false
        }
        
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
            resignFirstResponder()
            saveNewPOI()
        default:
            print("ERROR (AddPOIViewController): Unknown text field!")
        }
        
        return false
    }
}
