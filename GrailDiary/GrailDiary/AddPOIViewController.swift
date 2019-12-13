//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Tobi Kuyoro on 12/12/2019.
//  Copyright © 2019 Tobi Kuyoro. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

var delegate: AddPOIDelegate?

class AddPOIViewController: UIViewController {
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
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
        guard let location = locationTextField.text,
            let country = countryTextField.text else { return }
            
            var poi = POI(location: location, country: country, clues: [])
        
        if let clue1TextField = clue1TextField.text,
            !clue1TextField.isEmpty {
            poi.clues.append(clue1TextField)
        }
        
        if let clue2TextField = clue2TextField.text,
            !clue2TextField.isEmpty {
            poi.clues.append(clue2TextField)
        }
        
        if let clue3TextField = clue3TextField.text,
            !clue3TextField.isEmpty {
            poi.clues.append(clue3TextField)
        }
        
        delegate?.poiWasAdded(poi)
    }
}

extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
