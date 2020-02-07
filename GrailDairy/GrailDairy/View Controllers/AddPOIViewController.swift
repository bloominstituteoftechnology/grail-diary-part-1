//
//  AddPOIViewController.swift
//  GrailDairy
//
//  Created by Juan M Mariscal on 2/5/20.
//  Copyright © 2020 Juan M Mariscal. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ location: POI)
}



class AddPOIViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    
    // MARK: Private Properties
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [locationTextField, countryTextField, clue1TextField,clue2TextField, clue3TextField].forEach { $0.delegate = self }
    }
    
    // MARK: - IBActions
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        guard let location = locationTextField.text, let country = countryTextField.text, !location.isEmpty, !country.isEmpty else { return }
        
        var locationInterest = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1TextField.text, !clue1.isEmpty {
            locationInterest.clues.append(clue1)
        }
        if let clue2 = clue2TextField.text, !clue2.isEmpty {
            locationInterest.clues.append(clue2)
        }
        if let clue3 = clue3TextField.text, !clue3.isEmpty {
            locationInterest.clues.append(clue3)
        }
        
        delegate?.poiWasAdded(locationInterest)
        
        self.dismiss(animated: true, completion: nil)
    }
    

}

extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
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
        return false
    }
}
