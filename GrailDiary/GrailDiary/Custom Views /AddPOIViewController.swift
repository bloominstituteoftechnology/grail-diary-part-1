//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Sammy Alvarado on 4/16/20.
//  Copyright © 2020 Sammy Alvarado. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

 

class AddPOIViewController: UIViewController {

    @IBOutlet var locationLabel: UITextField!
    @IBOutlet var countryLabel: UITextField!
    @IBOutlet var clue1Label: UITextField!
    @IBOutlet var clue2Label: UITextField!
    @IBOutlet var clue3Label: UITextField!
    
//    var delegate = AddPOIDelegate? // Not sure why this is requiring .self
   
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = locationLabel.text,
            let country = countryLabel.text,
            !location.isEmpty,
            !country.isEmpty else { return }
        
        var poi = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1Label.text,
            !clue1.isEmpty {
            poi.clues.append(clue1)
        }
        
        if let clue2 = clue2Label.text,
            !clue2.isEmpty {
            poi.clues.append(clue2)
        }
        
        if let clue3 = clue3Label.text,
            !clue3.isEmpty {
            poi.clues.append(clue3)
        }
        
//        delegate.init(AppDelegate.self as! AddPOIDelegate)
//        dismiss(animated: true, completion: nil)
    }
}

extension AddPOIViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
