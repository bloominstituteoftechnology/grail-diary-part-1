//
//  AddPOIViewController.swift
//  Grail Diary Part 1
//
//  Created by Dojo on 5/28/20.
//  Copyright © 2020 Dojo. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    @IBOutlet weak var countryText: UITextField!
    @IBOutlet weak var locationText: UITextField!
    @IBOutlet weak var clue1: UITextField!
    @IBOutlet weak var clue2: UITextField!
    @IBOutlet weak var clue3: UITextField!
    
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = locationText.text, let country = countryText.text else { return }
        
        var clues: [String] = []
        
        if let clue1 = clue1.text, !clue1.isEmpty{
            clues.append(clue1)
        }
        
        if let clue2 = clue2.text, !clue2.isEmpty{
            clues.append(clue2)
        }
        
        if let clue3 = clue3.text, !clue3.isEmpty{
            clues.append(clue3)
        }
        
        let poi = POI(location: location, country: country, clues: clues)
        
        delegate?.poiWasAdded(poi)
    }
}

extension AddPOIViewController: UITextFieldDelegate{
    private func textFieldShouldReturn(textField: UITextField) -> Bool {
        if let unwrappedTextField = textField.text, !unwrappedTextField.isEmpty{
            switch textField {
            case locationText:
                countryText.becomeFirstResponder()
            case countryText:
                clue1.becomeFirstResponder()
            case clue1:
                clue2.becomeFirstResponder()
            case clue2:
                clue3.becomeFirstResponder()
            default:
                resignFirstResponder()
            }
        }
        return false
    }
}
