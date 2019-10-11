//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Jon Bash on 2019-10-10.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasSaved(_ poi: POI)
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
        
        if let clue1 = clue1TextField.text, !clue1.isEmpty {
            poi.clues.append(clue1)
        }
        if let clue2 = clue2TextField.text, !clue2.isEmpty {
            poi.clues.append(clue2)
        }
        if let clue3 = clue3TextField.text, !clue3.isEmpty {
            poi.clues.append(clue3)
        }
        
        delegate?.poiWasSaved(poi)
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
                self.moveCursorToFirstEmptyReqField()
        }))
        
        present(emptyFieldAlert, animated: true, completion: nil)
    }
}

extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return false }
        
        if (textField == locationTextField || textField == countryTextField) && text.isEmpty {
            showEmptyFieldAlert()
            return false
        }
        if ((textField == clue1TextField || textField == clue2TextField) && text.isEmpty)
            || textField == clue3TextField {
            resignFirstResponder()
            saveNewPOI()
        }
        
        textField.superview?.viewWithTag(textField.tag + 1)?.becomeFirstResponder()
        return false
    }
    
    func moveCursorToFirstEmptyReqField() {
        if let locationEmpty = self.locationTextField.text?.isEmpty, locationEmpty {
            self.locationTextField.becomeFirstResponder()
        } else {
            self.countryTextField.becomeFirstResponder()
        }
    }
}
