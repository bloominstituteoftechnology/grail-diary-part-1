//
//  AddPOIViewController.swift
//  Grail Diary
//
//  Created by Joseph Rogers on 7/29/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

//MARK: - step 11
//Wire up the delegate property of the tableview in the storyboard to the view controller

import UIKit
    //MARK: - step 13
    //Created my protocol that has the function poiWasAdded that is part of the protocol.
protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    //MARK: - step 12
    //Declared the 5 textfields within the view and gave them IBOutlets.
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    //MARK: - step 14
    //declared a variable of type AddPOIDelegate and made it optional.
    var delegate: AddPOIDelegate?
    //MARK: - step 15 - 18
    //created two functions for my cancelTapped(which dismisses the modular View I am on) and save tapped. Which safely unwraps two constants, location and country, and makes sure that the textfields for them are not empty. they can access this property due to the type they are inferred to. Which is of TextField.text type. each clue is unrapped and appends its data below to the variable poi we gave type POI struct to. then the data is passed through the delegates poiWasAdded function
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = locationTextField.text,
            let country = countryTextField.text,
            !location.isEmpty, !country.isEmpty else { return }
        
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
    //MARK: - step 19 - 21
    //This makes my POIVC conform to the UITFD delegate protocol. Then it calls the function textFieldShouldReturn function that is provided from aformentioned delegate. we used a switch statement to change the first responders that are next in line to be filled out once the return button is pressed. Until at which it will resign the responding function by default.
extension AddPOIViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text,
            !text.isEmpty {
            switch textField{
            case locationTextField:
                countryTextField.becomeFirstResponder()
            case countryTextField:
                clue1TextField.becomeFirstResponder()
            case clue1TextField:
                clue2TextField.becomeFirstResponder()
            case clue2TextField:
                clue3TextField.becomeFirstResponder()
            default:
                resignFirstResponder()
            }
        }
        return false
    }
}
