//
//  AddPOIViewController.swift
//  grail-diary-part-1
//
//  Created by Samuel Esserman on 2/18/20.
//  Copyright © 2020 Samuel Esserman. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        guard let location = locationTextField.text,
            let country = countryTextField.text else { return }
        
        var poi = POI(location: location, country: country)
        
        if let text = clue1TextField.text {
            poi.clues.append(text)
        }
        
        if let text = clue2TextField.text {
            poi.clues.append(text)
        }
        
        if let text = clue3TextField.text {
            poi.clues.append(text)
        }
        
        delegate?.poiWasAdded(poi)
        
        dismiss(animated: true, completion: nil)
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
        guard let text = textField.text,
            !text.isEmpty else { return false }
        
        switch textField {
        case locationTextField:
            return locationTextField.becomeFirstResponder()
        case countryTextField:
            return countryTextField.becomeFirstResponder()
        case clue1TextField:
            return clue1TextField.becomeFirstResponder()
        case clue2TextField:
            return clue2TextField.becomeFirstResponder()
        case clue3TextField:
            return clue3TextField.becomeFirstResponder()
        default:
            return false
        }
    }
}
