//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Elizabeth Thomas on 2/5/20.
//  Copyright © 2020 Libby Thomas. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func POIWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    // MARK: - Private Properties
    var delegate: AddPOIDelegate?
    
    // MARK: - IBActions
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let location = locationTextField.text,
            let country = countryTextField.text,
            !location.isEmpty,
            !country.isEmpty else { return }
        
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
        
        delegate?.POIWasAdded(poi)
    }
}

// In the storyboard, for each textfield in this view, connect the delegate property of the textfield to this class.
// Implement the delegate method textFieldShouldReturn(_:); unwrap the text and make sure it's not empty, then switch off the textfield to determine which one called this method; change the firstResponder status to the appropriate textfield.

extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text {
            switch textField {
            case <#pattern#>:
                <#code#>
            default:
                <#code#>
            }
        }
    }
}
