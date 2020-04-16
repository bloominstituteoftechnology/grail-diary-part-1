//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Marissa Gonzales on 4/15/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

import UIKit



protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    @IBOutlet weak var buttonTest: UIButton!
    
    var delegate: AddPOIDelegate?
    
    // Name & Location TextFields
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    
    // 3 Clue Text Fields
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    // Cancel Button Tapped
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // Save Button Tapped
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let location = locationTextField.text,
            let country = countryTextField.text else { return }
        
        var clues: [String] = []
        
        if let clue1 = clue1TextField.text,

            clue1 != "" {
            clues.append(clue1)
        }
        if let clue2 = clue2TextField.text,

            clue2 != "" {
            clues.append(clue2)
        }
        if let clue3 = clue3TextField.text,

            clue3 != "" {
            clues.append(clue3)
        }
        
        let poi = POI(location: location, country: country, clues: clues)
        
        delegate?.poiWasAdded(poi)
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}


extension AddPOIViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let location = locationTextField.text {
            locationTextField.text = location
        }
        
        if let country = countryTextField.text {
            countryTextField.text = country
        }
        
        if let textField = textField.text {
            switch textField {
            case clue1TextField.text:
                return clue1TextField.becomeFirstResponder()
            case clue2TextField.text:
                return clue2TextField.becomeFirstResponder()
            case clue3TextField.text:
                return clue3TextField.becomeFirstResponder()
            default:
                break
            }
        }
        return false
    }
}
