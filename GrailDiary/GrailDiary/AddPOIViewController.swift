//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Hunter Oppel on 3/19/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    var delegate: AddPOIDelegate?
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        guard let location = locationTextField.text,
            let country = countryTextField.text else { return }
        
        var clues: [String] = []
        if let clue1 = clue1TextField.text,
            !clue1.isEmpty {
            clues.append(clue1)
        }
        if let clue2 = clue2TextField.text,
            !clue2.isEmpty {
            clues.append(clue2)
        }
        if let clue3 = clue3TextField.text,
            !clue3.isEmpty {
            clues.append(clue3)
        }
        
        let poi = POI(location: location, country: country, clues: clues)
        
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
        guard let _ = textField.text else {
            fatalError("Textfield returned nil.")
        }
        switch textField {
        case locationTextField:
            return locationTextField.isFirstResponder
        case countryTextField:
            return countryTextField.isFirstResponder
        case clue1TextField:
            return clue1TextField.isFirstResponder
        case clue2TextField:
            return clue2TextField.isFirstResponder
        default:
            return clue3TextField.isFirstResponder
        }
    }
}
