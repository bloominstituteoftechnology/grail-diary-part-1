//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Dahna on 3/19/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
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
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        
        guard let location = locationTextField.text,
            let country = countryTextField.text else { return }

        var newClues: [String] = []

        if let clue1 = clue1TextField.text,
            !clue1.isEmpty {
            newClues.append(clue1)
        }

        if let clue2 = clue2TextField.text,
            !clue2.isEmpty{
            newClues.append(clue2)
        }

        if let clue3 = clue3TextField.text,
            !clue3.isEmpty {
            newClues.append(clue3)
        }

        let poi = POI(location: location, country: country, clues: newClues)

        delegate?.poiWasAdded(poi)
        dismiss(animated: true, completion: nil)

    }
    
}

extension AddPOIViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let _ = textField.text {
            switch textField {
            case locationTextField:
                countryTextField.becomeFirstResponder()
            case countryTextField:
                clue1TextField.becomeFirstResponder()
            case clue1TextField:
                clue2TextField.becomeFirstResponder()
            case clue2TextField:
                clue3TextField.becomeFirstResponder()
            default:
                clue3TextField.resignFirstResponder()
                return false
            }
        }
        return true
    }
    
}


