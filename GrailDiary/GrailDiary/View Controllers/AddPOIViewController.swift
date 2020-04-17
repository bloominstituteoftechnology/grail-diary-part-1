//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Ian French on 4/16/20.
//  Copyright © 2020 Ian French. All rights reserved.
//

import UIKit


protocol AddPOIDelegate {
    
    func poiWasAdded(poi: POI)
    
}




class AddPOIViewController: UIViewController {

   
    
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var countryTextField: UITextField!
    
    @IBOutlet weak var clue1TextField: UITextField!
    
    @IBOutlet weak var clue2TextField: UITextField!
    
    @IBOutlet weak var clue3TextField: UITextField!
    
    
    var delegate: AddPOIDelegate?
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        
        guard let location = locationTextField.text,
             let country = countryTextField.text,
                 !location.isEmpty,
                 !country.isEmpty else { return}
             
             var poiEntry = POI(location: location, country: country, clues: [])
             
             
             
             if let clue1 = clue1TextField.text,
                 !clue1.isEmpty  {
                 poiEntry.clues.append(clue1)
             }
             
             if let clue2 = clue2TextField.text,
                  !clue2.isEmpty  {
                  poiEntry.clues.append(clue2)
             }
              
             if let clue3 = clue3TextField.text,
                           !clue3.isEmpty  {
                           poiEntry.clues.append(clue3)
             }
             
        delegate?.poiWasAdded(poi: poiEntry)
        dismiss(animated: true, completion: nil)
        
        
    }
    
    
    

    
}
// check step 21
extension AddPOIViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
