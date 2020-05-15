//
//  AddPOIViewController.swift
//  Grail Diary
//
//  Created by Joel Groomer on 7/30/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}


class AddPOIViewController: UIViewController {
    
    @IBOutlet weak var txtLocation: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtClue1: UITextField!
    @IBOutlet weak var txtClue2: UITextField!
    @IBOutlet weak var txtClue3: UITextField!
    
    var delegate: AddPOIDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        txtLocation.delegate = self
        txtCountry.delegate = self
        txtClue1.delegate = self
        txtClue2.delegate = self
        txtClue3.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = txtLocation.text, !location.isEmpty,
            let country = txtCountry.text, !country.isEmpty
            else { return }
        
        var newPOI = POI(location: location, country: country, clues: [])
        if let clue1 = txtClue1.text, !clue1.isEmpty {
            newPOI.clues.append(clue1)
        }
        if let clue2 = txtClue2.text, !clue2.isEmpty {
            newPOI.clues.append(clue2)
        }
        if let clue3 = txtClue3.text, !clue3.isEmpty {
            newPOI.clues.append(clue3)
        }
        
        delegate?.poiWasAdded(newPOI)
    }
}

extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text, !text.isEmpty else { return false }
        
        switch textField {
        case txtLocation:
            txtCountry.becomeFirstResponder()
        case txtCountry:
            txtClue1.becomeFirstResponder()
        case txtClue1:
            txtClue2.becomeFirstResponder()
        case txtClue2:
            txtClue3.becomeFirstResponder()
        case txtClue3:
            txtLocation.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        
        return false
    }
}
