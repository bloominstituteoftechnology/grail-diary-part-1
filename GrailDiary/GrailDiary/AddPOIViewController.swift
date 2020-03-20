//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Nihal Erdal on 3/19/20.
//  Copyright © 2020 Nihal Erdal. All rights reserved.
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
    
    
    var delegate : AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryTextField.delegate = self
        locationTextField.delegate = self
        clue1TextField.delegate = self
        clue2TextField.delegate = self
        clue3TextField.delegate = self
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveTapped(_ sender: Any) {
        
        guard let location = locationTextField.text,
            let country = countryTextField.text,
            !location.isEmpty,
            !country.isEmpty
        else {
            fatalError("Please fill the blanks required")
        }
            
        var newClues : [String] = []
        
        if let clue1 = clue1TextField.text,!clue1.isEmpty {
            newClues.append(clue1)
        }
        
        if let clue2 = clue2TextField.text,!clue2.isEmpty {
                  newClues.append(clue2)
              }
        
        if let clue3 = clue3TextField.text,!clue3.isEmpty {
                  newClues.append(clue3)
              }
        
        let poi = POI(location: location, country: country, clues: newClues)
        
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

extension AddPOIViewController : UITextFieldDelegate {
    
    
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//
//        if let text = textField.text, !text.isEmpty{
//
//            switch textField {
//
//            case locationTextField:
//                locationTextField.becomeFirstResponder()
//            case countryTextField:
//                countryTextField.becomeFirstResponder()
//            case clue1TextField:
//                clue1TextField.becomeFirstResponder()
//            case clue2TextField:
//                clue2TextField.becomeFirstResponder()
//            case clue3TextField:
//                clue3TextField.becomeFirstResponder()
//
//            default:break
//
//            }
//        }
//       return true
//}
   
}
