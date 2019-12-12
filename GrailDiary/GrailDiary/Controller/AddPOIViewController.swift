//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Kenny on 12/11/19.
//  Copyright © 2019 Hazy Studios. All rights reserved.
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
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let locationText = locationTextField.text else { return }
        
        guard let countryText = countryTextField.text else { return }
        var poi = POI(location: locationText, country: countryText, clues: [])
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
    
    var delegate: AddPOIDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationTextField.delegate = self
        countryTextField.delegate = self
        clue1TextField.delegate = self
        clue2TextField.delegate = self
        clue3TextField.delegate = self
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
        if textField.text != "" {
            switch textField.placeholder {
            case "Location":
                locationTextField.resignFirstResponder()
                countryTextField.becomeFirstResponder()
            case "Country":
                countryTextField.resignFirstResponder()
                clue1TextField.becomeFirstResponder()
            case "Clue 1":
                clue1TextField.resignFirstResponder()
                clue2TextField.becomeFirstResponder()
            case "Clue 2":
                clue2TextField.resignFirstResponder()
                clue3TextField.becomeFirstResponder()
            case "Clue 3":
                clue3TextField.resignFirstResponder()
            default:
                break
            }
        }
        return true
    }
}
