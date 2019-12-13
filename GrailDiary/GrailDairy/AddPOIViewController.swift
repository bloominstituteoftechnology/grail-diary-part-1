//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Michael on 12/12/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(pointOfInterest: POI)
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

        locationTextField.delegate = self
        countryTextField.delegate = self
        clue1TextField.delegate = self
        clue2TextField.delegate = self
        clue3TextField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveTapped(_ sender: Any) {
        guard let location = locationTextField.text,
            let country = countryTextField.text,
            !location.isEmpty,
            !country.isEmpty else { return }
        
        var pointOfInterest = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1TextField.text,
            !clue1.isEmpty {
            pointOfInterest.clues.append(clue1)
        }
        
        if let clue2 = clue2TextField.text,
            !clue2.isEmpty {
            pointOfInterest.clues.append(clue2)
        }
        
        if let clue3 = clue3TextField.text,
            !clue3.isEmpty {
            pointOfInterest.clues.append(clue3)
            
            delegate?.poiWasAdded(pointOfInterest: pointOfInterest)
            dismiss(animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let textField = textField.text,
            !textField.isEmpty {
        
            switch textField {
        case locationTextField.text:
            locationTextField.resignFirstResponder()
            countryTextField.becomeFirstResponder()
        case countryTextField.text:
            countryTextField.resignFirstResponder()
            clue1TextField.becomeFirstResponder()
        case clue1TextField.text:
            clue1TextField.resignFirstResponder()
            clue2TextField.becomeFirstResponder()
        case clue2TextField.text:
            clue2TextField.resignFirstResponder()
            clue3TextField.becomeFirstResponder()
        case clue3TextField.text:
            clue3TextField.resignFirstResponder()
        default:
            break
        }
        
        }
        return false
    }
}



