//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Aaron Peterson on 4/16/20.
//  Copyright © 2020 Aaron Peterson. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_poi: POI)
}

class AddPOIViewController: UIViewController {

    @IBOutlet weak var locationTextfield: UITextField!
    @IBOutlet weak var countryTextfield: UITextField!
    @IBOutlet weak var clue1Textfield: UITextField!
    @IBOutlet weak var clue2Textfield: UITextField!
    @IBOutlet weak var clue3Textfield: UITextField!
    
    var delegate: AddPOIDelegate?
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = locationTextfield.text, let country = countryTextfield.text else {
            return
        }
        
        var poi = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1Textfield.text {
            poi.clues.append(clue1)
        }
        
        if let clue2 = clue1Textfield.text {
            poi.clues.append(clue2)
        }
        
        if let clue3 = clue1Textfield.text {
            poi.clues.append(clue3)
        }
        
        delegate?.poiWasAdded(_poi: poi)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
