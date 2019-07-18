//
//  AddPOIViewController.swift
//  Grail Diary
//
//  Created by brian vilchez on 7/17/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit
protocol addPOIDelegate {
    func poiWasAdded(_ poi:POI)
}

class AddPOIViewController: UIViewController {
    
    var delegate: addPOIDelegate?
    
    @IBOutlet weak var countryLabel: UITextField!
    @IBOutlet weak var clues3TextField: UITextField!
    @IBOutlet weak var clues2TextField: UITextField!
    @IBOutlet weak var clues1Textfield: UITextField!
    @IBOutlet weak var locationLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func SaveButton(_ sender: UIBarButtonItem) {
        
        guard let country = countryLabel.text,
            let location = locationLabel.text,
            !country.isEmpty, !location.isEmpty else {return}
        var poi = POI(location: location, Country: country, clues: [])
        
        if let clue1 = clues1Textfield.text, !clue1.isEmpty {
            poi.clues.append(clue1)
        }
        if let clue2 = clues2TextField.text, !clue2.isEmpty {
            poi.clues.append(clue2)
        }
        if let clue3 = clues3TextField.text, !clue3.isEmpty {
            poi.clues.append(clue3)
            
        }
        delegate?.poiWasAdded(poi)
    }
}

extension AddPOIViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            switch textField {
            case locationLabel: countryLabel.becomeFirstResponder()
            case countryLabel: clues1Textfield.becomeFirstResponder()
            case clues1Textfield: clues2TextField.becomeFirstResponder()
            case clues2TextField: clues3TextField.becomeFirstResponder()
            default: textField.resignFirstResponder()
            }
            
        }
        return false
    }
    
    
    
}
