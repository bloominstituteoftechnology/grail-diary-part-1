//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Bronson Mullens on 4/16/20.
//  Copyright © 2020 Bronson Mullens. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = locationTextField.text,
            let country = countryTextField.text,
            !location.isEmpty,
            !country.isEmpty else { return }
        var newPOI = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1TextField.text,
            !clue1.isEmpty {
            newPOI.clues.append(clue1)
        }
        
        if let clue2 = clue2TextField.text,
            !clue2.isEmpty {
            newPOI.clues.append(clue2)
        }
        
        if let clue3 = clue3TextField.text,
            !clue3.isEmpty {
            newPOI.clues.append(clue3)
        }
        
        delegate?.poiWasAdded(newPOI)
        dismiss(animated: true, completion: nil)
    }
    
    var delegate: AddPOIDelegate?
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let unwrappedText = textField.text {
            
            switch textField {
            case locationTextField:
                locationTextField.becomeFirstResponder()
            case countryTextField:
                countryTextField.becomeFirstResponder()
            case clue1TextField:
                clue1TextField.becomeFirstResponder()
            case clue2TextField:
                clue2TextField.becomeFirstResponder()
            case clue3TextField:
                clue3TextField.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
            }
        }
        return false
    }
}
    
    /*
    // MARK: - Navigation
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

extension AddPOIViewController: UITextFieldDelegate {
    // It conforms?
}
