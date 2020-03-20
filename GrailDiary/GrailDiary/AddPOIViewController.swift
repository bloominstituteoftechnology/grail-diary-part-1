//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Marissa Gonzales on 3/19/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    
    @IBOutlet weak var newLocationTextField: UITextField!
    @IBOutlet weak var newCountryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    

    var delegate: AddPOIDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        
        // Grab the new location and country
        
        guard let newLocation = newLocationTextField.text,
            let newCountry = newCountryTextField.text  else {
                return
    }
    
        var newPOI: POI = POI(location: "Here", country: "There", clues: nil)
        
        
        
        var newClues: [String] = []
        
        if let clue1 = clue1TextField.text,
            !clue1.isEmpty {
            newClues.append(clue1)
        }
        
        if let clue2 = clue2TextField.text,
        !clue2.isEmpty {
        newClues.append(clue2)
        }
        
        if let clue3 = clue3TextField.text,
        !clue3.isEmpty {
        newClues.append(clue3)
        }
        
        newPOI.clues = newClues
        
        delegate?.poiWasAdded(newPOI)
    }
    
}
extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
    if let someText = textField.text {
        if !someText.isEmpty {
            switch textField {
                    
            case newLocationTextField:
                newLocationTextField.becomeFirstResponder()
                    
            case newCountryTextField:
                newCountryTextField.becomeFirstResponder()
                
            case clue1TextField:
                clue1TextField.becomeFirstResponder()
                
            case clue2TextField:
                clue2TextField.becomeFirstResponder()
                
            case clue3TextField:
                clue3TextField.becomeFirstResponder()
                
            default: break
            }
        }
    }
         return true
}
}
    

    

    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


