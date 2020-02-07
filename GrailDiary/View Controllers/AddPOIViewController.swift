//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by David Williams on 2/6/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ pois: POI)
}

class AddPOIViewController: UIViewController {
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    @IBOutlet weak var clue4TextField: UITextField!
    @IBOutlet weak var addClueButton: UIButton!
    
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [locationTextField, countryTextField, clue1TextField, clue2TextField, clue3TextField, clue4TextField].forEach { $0.delegate = self}
        
        view.backgroundColor = .lightGray
        clue4TextField.isHidden = true
        addClueButton.isHidden = true
        view.backgroundColor = .lightGray
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savePOIButtonTapped(_ sender: Any) {
        guard let location = locationTextField.text, let country = countryTextField.text,
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
        
        if let clue4 =  clue4TextField.text,
            !clue4.isEmpty {
            poi.clues.append(clue4)
        }
        
        delegate?.poiWasAdded(poi)
        dismiss(animated: true)
    }
    
    @IBAction func addCluePressed(_ sender: Any) {
        clue4TextField.isHidden = false
    }
}

extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text,
            !text.isEmpty else { return false }
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
            addClueButton.isHidden = false
            clue4TextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return false
    }
}
