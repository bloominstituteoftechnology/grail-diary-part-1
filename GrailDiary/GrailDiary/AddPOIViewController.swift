//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Donella Barcelo on 11/7/19.
//  Copyright © 2019 Donella Barcelo. All rights reserved.
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

        locationTextField.delegate = self
        countryTextField.delegate = self
        clue1TextField.delegate = self
        clue2TextField.delegate = self
        clue3TextField.delegate = self
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveTapped(_ sender: Any) {
        
        if let location = locationTextField.text,
            let country = countryTextField.text,
            !location.isEmpty,
            !country.isEmpty {
            
            var poi = POI(location: location, country: country, clues: [])
            
            if let clue1 = clue1TextField.text,
                !clue1.isEmpty {
                poi.clues.append(clue1)
            }
            
            if let clue2 = clue2TextField.text,
                !clue2.isEmpty {
                poi.clues.append(clue2)
            }
            
            if let clue3 = clue3TextField.text,
                !clue3.isEmpty {
                poi.clues.append(clue3)
            }
            
            delegate?.poiWasAdded(poi)
        }
    }
}

extension AddPOIViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
