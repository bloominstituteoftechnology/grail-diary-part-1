//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Chris Dobek on 3/19/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(poi : POI)
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
}
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        
        guard let newLocation = locationTextField.text,
            let newCountry = countryTextField.text else {
            return
        }
        
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
        
        let poi = POI(location: newLocation, country: newCountry, clues: newClues)
    
        delegate?.poiWasAdded(poi: poi)
        dismiss(animated: true, completion: nil)
    
    }
}
