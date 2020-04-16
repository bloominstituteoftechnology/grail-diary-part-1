//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Enzo Jimenez-Soto on 4/16/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//
import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(poi: POI)
}

class AddPOIViewController: UIViewController {
    
   
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        
        guard let location = locationTextField.text,
            let country = countryTextField.text, !location.isEmpty, !country.isEmpty else { return }
        
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

extension AddPOIViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

