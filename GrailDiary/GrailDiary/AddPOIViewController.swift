//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Jorge Alvarez on 12/12/19.
//  Copyright © 2019 Jorge Alvarez. All rights reserved.
//

import UIKit

// 13 done
protocol AddPOIDelegate {
    func poiWasAdded(poi: POI) // used to be (_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    // 12 done
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    // 15 done
    // 16 done
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // 17, 18 done
    @IBAction func saveTapped(_ sender: Any) {
        
        guard let location = locationTextField.text, let country = countryTextField.text, !location.isEmpty, !country.isEmpty else {return}
        
        var poi = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1TextField.text, !clue1.isEmpty {
            poi.clues.append(clue1)
        }
        
        if let clue2 = clue2TextField.text, !clue2.isEmpty {
            poi.clues.append(clue2)
        }
        
        if let clue3 = clue3TextField.text, !clue3.isEmpty {
            poi.clues.append(clue3)
        }
        
        delegate?.poiWasAdded(poi: poi)
        
        dismiss(animated: true, completion: nil)
    }
    
    // 14 done
    var delegate: AddPOIDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationTextField.delegate = self
        countryTextField.delegate = self
        clue1TextField.delegate = self
        clue2TextField.delegate = self
        clue3TextField.delegate = self
    }

}

// 19 done
extension AddPOIViewController: UITextFieldDelegate {

    // 21 NOT DONE
     /*
     unwrap the text and make sure it's not empty, then switch off the textfield to determine which one called this method;
     change the firstResponder status to the appropriate textfield
    */
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // dismisses the keyboard
        textField.resignFirstResponder()
        return true
    }
}
