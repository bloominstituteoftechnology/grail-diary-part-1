//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Rob Vance on 4/15/20.
//  Copyright © 2020 Robs Creations. All rights reserved.
//

import UIKit
protocol AddPOIDelegate {
    func newPOIAdded(poi: POI)
}
class AddPOIViewController: UIViewController {
// Mark: IBOutlets
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clues1TextField: UITextField!
    @IBOutlet weak var clues2TextField: UITextField!
    @IBOutlet weak var clues3TextField: UITextField!
    
    
    var delegate: AddPOIDelegate?
// Mark: IBActions
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveTapped(_ sender: Any) {
        guard let location = locationTextField.text,
            let country = countryTextField.text,
            !location.isEmpty,
            !country.isEmpty else { return }
        var poi = POI(location: location, country: country, clues: [] )
        
        if let clue1 = clues1TextField.text,
            !clue1.isEmpty {
            poi.clues.append(clue1)
        }
        if let clue2 = clues2TextField.text,
            !clue2.isEmpty {
            poi.clues.append(clue2)
        }
        if let clue3 = clues3TextField.text,
            !clue3.isEmpty {
            poi.clues.append(clue3)
        }
        delegate?.newPOIAdded(poi: poi)
        dismiss(animated: true, completion: nil)
        
    }
}

extension AddPOIViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
