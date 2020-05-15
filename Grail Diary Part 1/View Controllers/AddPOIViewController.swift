//
//  AddPOIViewController.swift
//  Grail Diary Part 1
//
//  Created by Dillon P on 7/29/19.
//  Copyright © 2019 Dillon P. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    // MARK: - Outlets
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    @IBOutlet weak var landmarkImagePicker: UIPickerView!
    
    // MARK: - Properties
    
    var delegate: AddPOIDelegate?
    var landmark: String = "Eiffel Tower"
    let landmarks = ["Eiffel Tower", "Statue of Liberty", "Great Pyramids", "Machu Picchu", "Colosseum", "Taj Mahal", "Great Wall Of China", "Christ The Redeemer"]
    
    // MARK: - Picker View Functions
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return landmarks[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return landmarks.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        landmark = landmarks[row]
    }
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationTextField.delegate = self
        countryTextField.delegate = self
        clue1TextField.delegate = self
        clue2TextField.delegate = self
        clue3TextField.delegate = self
        landmarkImagePicker.delegate = self
    }
    
    // MARK: - Actions
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = locationTextField.text,
            let country = countryTextField.text,
            !location.isEmpty,
            !country.isEmpty else { return }
        
        var poi = POI(location: location, country: country, clues: [], landmark: landmark)
        
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
    }
    
}

    // MARK: - Protocols

    extension AddPOIViewController: UITextFieldDelegate {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if let text = textField.text, !text.isEmpty {
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
                    textField.resignFirstResponder()
                }
            }
            return false
        }
    }

