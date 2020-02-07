//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Robert on 2/5/20.
//  Copyright © 2020 Robs Creations. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_poi: POI)
}



class AddPOIViewController: UIViewController {
var delegate: AddPOIDelegate?
    
    //Mark: IBOutlet
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
//Mark: IBAction
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let location = locationTextField.text,
        let country = countryTextField.text,
            !location.isEmpty,
            !country.isEmpty else {return}

    var poi = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1TextField.text,
            !clue1.isEmpty {
            poi.clues.append(clue1)
        }
        if let clue2 = clue2TextField.text,
            !clue2.isEmpty {
            poi.clues.append(clue2)
        }
        if let clue3 = clue3TextField.text,
            !clue3.isEmpty {
            poi.clues.append(clue3)
        }
        delegate?.poiWasAdded(_poi: poi)
//        self.dismiss(animated: true)
    }
    

    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    

  

}
