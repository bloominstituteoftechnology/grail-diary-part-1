//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by David Wright on 11/21/19.
//  Copyright © 2019 David Wright. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var countryTextField: UITextField!
    @IBOutlet var clue1TextField: UITextField!
    @IBOutlet var clue2TextField: UITextField!
    @IBOutlet var clue3TextField: UITextField!
    
    // MARK: - Properties
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBActions
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = locationTextField.text,
            let country = countryTextField.text else { return }
        
        var poi = POI(location: location, country: country, clues: [])
        
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
        if let text = textField.text,
            !text.isEmpty {
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
                textField.resignFirstResponder()
            }
        }
        return false
    }
}
