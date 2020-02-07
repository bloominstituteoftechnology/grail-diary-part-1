//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Lambda_School_Loaner_259 on 2/6/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    // MARK: IBAction
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = locationTextField.text,
            let country = countryTextField.text,
            !location.isEmpty,
            !country.isEmpty else { return }
        
        var poi: POI = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1TextField.text {
            poi.clues.append(clue1)
        }
        
        if let clue2 = clue2TextField.text {
            poi.clues.append(clue2)
        }
        
        if let clue3 = clue3TextField.text {
            poi.clues.append(clue3)
        }
        
        delegate?.poiWasAdded(poi)
        
        
        
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    
    // MARK: Properties
    var delegate: AddPOIDelegate?
    var locationDelegate: UITextFieldDelegate!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        [locationTextField, countryTextField, clue1TextField, clue2TextField, clue3TextField].forEach{$0.delegate = self}

        // Do any additional setup after loading the view.
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
        if let text = textField.text, !text.isEmpty {
            switch textField {
            case locationTextField:
                countryTextField.becomeFirstResponder()
            case countryTextField:
                clue1TextField.becomeFirstResponder()
            case clue1TextField:
                clue2TextField.becomeFirstResponder()
            case clue2TextField:
                clue3TextField.becomeFirstResponder()
            default:
                locationTextField.becomeFirstResponder()
            }
            return true
        } else {
            return false
        }
    }
}
