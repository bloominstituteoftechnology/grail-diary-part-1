//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by dc on 2/20/20.
//  Copyright © 2020 Diego Covarrubias. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {

    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clueOneTextField: UITextField!
    @IBOutlet weak var clueTwoTextField: UITextField!
    @IBOutlet weak var clueThreeTextField: UITextField!
    
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        if let delegate = self.delegate {
            guard let location = locationTextField.text else { return }
            guard let country = countryTextField.text else { return }
            
            var clues = Array<String>()
            func maybeAppendClue(_ textField: UITextField) {
                if let clue = textField.text {
                    clues.append(clue)
                }
            }
            maybeAppendClue(clueOneTextField)
            maybeAppendClue(clueTwoTextField)
            maybeAppendClue(clueThreeTextField)
            
            delegate.poiWasAdded(POI(
                location: location,
                country: country,
                clues: clues
            ))
        }
    }
}

extension AddPOIViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text != nil {
            switch textField {
            case locationTextField:
                countryTextField.becomeFirstResponder()
            case countryTextField:
                clueOneTextField.becomeFirstResponder()
            case clueOneTextField:
                clueTwoTextField.becomeFirstResponder()
            case clueTwoTextField:
                clueThreeTextField.becomeFirstResponder()
            default:
                return true
            }
            return false
        }
        
        return true
    }
}
