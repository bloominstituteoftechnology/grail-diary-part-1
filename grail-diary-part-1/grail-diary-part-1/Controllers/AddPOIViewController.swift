//
//  AddPOIViewController.swift
//  grail-diary-part-1
//
//  Created by Aaron on 7/30/19.
//  Copyright © 2019 AlphaGrade, INC. All rights reserved.
//

import UIKit


protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UITextField!
    
    @IBOutlet weak var countryLabel: UITextField!
    @IBOutlet weak var clues1TextField: UITextField!
    @IBOutlet weak var clues2TextField: UITextField!
    @IBOutlet weak var clues3TextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var delegate: AddPOIDelegate?
    
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        guard let location = locationLabel.text, !location.isEmpty, let country = countryLabel.text, !country.isEmpty else {return}
        
        var inputPOI = POI(location: location, country: country, clues: [])
        
        if let clue1 =  clues1TextField.text, !clue1.isEmpty {
            inputPOI.clues.append(clue1)
        }
        if let clue2 =  clues2TextField.text, !clue2.isEmpty {
            inputPOI.clues.append(clue2)
        }
        if let clue3 =  clues3TextField.text, !clue3.isEmpty {
            inputPOI.clues.append(clue3)
        }
        
        delegate?.poiWasAdded(inputPOI)
        
    }
    
    
}

extension AddPOIViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            switch textField {
            case countryLabel: countryLabel.becomeFirstResponder()
            case locationLabel: locationLabel.becomeFirstResponder()
            case clues1TextField: clues1TextField.becomeFirstResponder()
            case clues2TextField: clues2TextField.becomeFirstResponder()
            case clues3TextField: clues3TextField.becomeFirstResponder()
            default: textField.resignFirstResponder()
            }
        }
        return false
    }
    
    
    
}
