//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Matthew Martindale on 2/5/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
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
        [locationTextField, countryTextField, clue1TextField, clue2TextField, clue3TextField].forEach {$0.delegate = self }
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = locationTextField.text,
        let country = countryTextField.text,
        !location.isEmpty,
        !country.isEmpty else { return }
        
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
        self.dismiss(animated: true)
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
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
