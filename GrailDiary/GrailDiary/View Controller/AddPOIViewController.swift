//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Bradley Yin on 7/17/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasCreated(poi: POI)
}

class AddPOIViewController: UIViewController {
    
    @IBOutlet weak var locationTextfield: UITextField!
    @IBOutlet weak var countryTextfield: UITextField!
    @IBOutlet weak var clue1Textfield: UITextField!
    @IBOutlet weak var clue2Textfield: UITextField!
    @IBOutlet weak var clue3Textfield: UITextField!
    
    var delegate : AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
   
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        guard let location = locationTextfield.text, !location.isEmpty, let country = countryTextfield.text, !country.isEmpty else {return}
        var poi = POI(location: location, country: country, clues: [])
        if let clue1 = clue1Textfield.text {
            poi.clues.append(clue1)
        }
        if let clue2 = clue2Textfield.text {
            poi.clues.append(clue2)
        }
        if let clue3 = clue3Textfield.text {
            poi.clues.append(clue3)
        }
       delegate?.poiWasCreated(poi: poi)
    }
    
}
extension AddPOIViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text,!text.isEmpty{
            switch textField{
            case locationTextfield:
                countryTextfield.becomeFirstResponder()
            case countryTextfield:
                clue1Textfield.becomeFirstResponder()
            case clue1Textfield:
                clue2Textfield.becomeFirstResponder()
            case clue2Textfield:
                clue3Textfield.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
            }
        }
        
        return false
        
    }
    
}
