//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Josh Kocsis on 4/16/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    @IBOutlet weak var locationLabel: UITextField!
    @IBOutlet weak var countryText: UITextField!
    @IBOutlet weak var clue1Text: UITextField!
    @IBOutlet weak var clue2Text: UITextField!
    @IBOutlet weak var clue3Text: UITextField!
    
    var delegate: AddPOIDelegate?
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func SaveTapped(_ sender: UIBarButtonItem) {
        
        guard let location = locationLabel.text,
        let country = countryText.text,
            !location.isEmpty,
            !country.isEmpty else { return }
                // Create Friend
        var newPOI = POI(location: location, country: country, clues: [])
                
        if let clue1 = clue1Text.text,
            !clue1.isEmpty {
            newPOI.clues.append(clue1)
            }
            if let clue2 = clue2Text.text,
                !clue2.isEmpty {
                newPOI.clues.append(clue2)
            }
            if let clue3 = clue3Text.text,
                !clue3.isEmpty {
                newPOI.clues.append(clue3)
            }
                
            delegate?.poiWasAdded(newPOI)
            dismiss(animated: true, completion: nil)
                
            }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension AddPOIViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
