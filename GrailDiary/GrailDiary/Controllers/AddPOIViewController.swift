//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by John Kouris on 7/24/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var countryTextField: UITextField!
    @IBOutlet var clueOneTextField: UITextField!
    @IBOutlet var clueTwoTextField: UITextField!
    @IBOutlet var clueThreeTextField: UITextField!
    
    var delegate: AddPOIDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = locationTextField.text, !location.isEmpty,
            let country = countryTextField.text, !country.isEmpty else {
                let alert = UIAlertController(title: "Missing Information", message: "Please enter a location and a country before saving", preferredStyle: .alert)
                let dismiss = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
                alert.addAction(dismiss)
                present(alert, animated: true, completion: nil)
                return
                
        }
        
        var poi = POI(location: location, country: country, clues: [])
        
        if let clue1 = clueOneTextField.text, let clue2 = clueTwoTextField.text, let clue3 = clueThreeTextField.text {
            poi.clues.append(contentsOf: [clue1, clue2, clue3])
        }
        
        delegate?.poiWasAdded(poi)
        
    }
}

extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            switch textField {
            case locationTextField:
                return textField.isFirstResponder
            case countryTextField:
                return textField.isFirstResponder
            case clueOneTextField:
                return textField.isFirstResponder
            case clueTwoTextField:
                return textField.isFirstResponder
            case clueThreeTextField:
                return textField.isFirstResponder
            default:
                return false
            }
        }
        return true
    }
}
