//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Lambda_School_loaner_226 on 7/8/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasCreated(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    @IBOutlet weak var locationNameTextField: UITextField!
    @IBOutlet weak var locationCountryTextField: UITextField!
    @IBOutlet weak var clueOneTextField: UITextField!
    @IBOutlet weak var clueTwoTextField: UITextField!
    @IBOutlet weak var clueThreeTextField: UITextField!
    
    var delegate: AddPOIDelegate?


    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        guard let location = locationNameTextField.text,
        let country = locationCountryTextField.text,
        !location.isEmpty,
        !country.isEmpty else { return }
        
        var poi = POI(location: location, country: country, clues: [])
        
        if let clueOne = clueOneTextField.text,
            !clueOne.isEmpty {
            poi.clues.append(clueOne)
        }
        
        if let clueTwo = clueTwoTextField.text,
            !clueTwo.isEmpty{
            poi.clues.append(clueTwo)
        }
        
        if let clueThree = clueThreeTextField.text,
            !clueThree.isEmpty {
            poi.clues.append(clueThree)
        }
        delegate?.poiWasCreated(poi)
    }
}

extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text,
            !text.isEmpty {
            switch textField {
            case locationCountryTextField:
                locationCountryTextField.becomeFirstResponder()
            case locationCountryTextField:
                clueOneTextField.becomeFirstResponder()
            case clueOneTextField:
                clueTwoTextField.becomeFirstResponder()
            case clueTwoTextField:
                clueThreeTextField.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
            }
        }
        return false
    }
}
