//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Joshua Rutkowski on 11/21/19.
//  Copyright © 2019 Joshua Rutkowski. All rights reserved.
//

import UIKit

protocol delegate: AddPOIDelegate {
       func poiWasAdded(_ poi: POI)
   }

class AddPOIViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var countryTextField: UITextField!
    @IBOutlet var clue1TextField: UITextField!
    @IBOutlet var clue2TextField: UITextField!
    @IBOutlet var clue3TextField: UITextField!
    
    var delegate: AddPOIDelegate?
    var textFieldDelegate: UITextFieldDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldDelegate = self
    }
    
    //Mark: - IBActions
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = locationTextField.text,
            let country = countryTextField.text,
            !location.isEmpty,
            !country.isEmpty else { return }
        
        var newPOI = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1TextField.text,
             !clue1.isEmpty {
             newPOI.clues.append(clue1)
         }
        
         if let clue2 = clue2TextField.text,
             !clue2.isEmpty {
             newPOI.clues.append(clue2)
         }

         if let clue3 = clue3TextField.text,
             !clue3.isEmpty {
             newPOI.clues.append(clue3)
         }
         delegate?.poiWasAdded(newPOI)
    }
}
    
    extension AddPOIViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text, !text.isEmpty else { return false}
        textField.resignFirstResponder()
        
        switch textField {
        case locationTextField:
            countryTextField.becomeFirstResponder()
        case countryTextField: clue1TextField.becomeFirstResponder()
        case clue1TextField: clue2TextField.becomeFirstResponder()
        case clue2TextField: clue3TextField.becomeFirstResponder()
        default:
            saveTapped(UIBarButtonItem())
        }
        return true
    }
}
