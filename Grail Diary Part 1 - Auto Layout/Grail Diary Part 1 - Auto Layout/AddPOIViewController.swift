//
//  AddPOIViewController.swift
//  Grail Diary Part 1 - Auto Layout
//
//  Created by Nicolas Rios on 7/17/19.
//  Copyright © 2019 Nicolas Rios. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
  func  poiWasAdded(_ poi: POI)
}
class AddPOIViewController: UIViewController {
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    var delegate:AddPOIDelegate?
   
    @IBAction func cancelTapped(_sender:UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var cancelTapped: UIToolbar!
    
     @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        @IBAction func saveTapped(_ sender: Any) {
        }
        guard let location = locationTextField.text,
        let country = countryTextField.text,
        !location.isEmpty,
        !country.isEmpty else { return }
        
        if let clue1 = clue1TextField.text,
            !clue1.isEmpty {
            Poi.clues.append(clue1)

       if let clue2 = clue2TextField.text,
        !clue2.isEmpty, {
        poi.clue.append(clue2)

     if let clue3 = clue3TextField.text,
            !clue3.isEmpty {
            poi.clue.append(clue3)
                
  }

 }       delegate?.poiWasAdded(POI)
        
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        locationTextField.resignFirstResponder()
        countryTextField.resignFirstResponder()
        clue1TextField.resignFirstResponder()
        clue2TextField.resignFirstResponder()
        clue3TextField.resignFirstResponder()
  }
}
        extension AddPOIViewController: UITextFieldDelegate {
            
            func textFieldShouldReturn(_ textField: UITextField) -> Bool {
              if  let text = textField.text,
                 !text.isEmpty {
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




