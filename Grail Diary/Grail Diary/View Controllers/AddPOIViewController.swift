//
//  AddPOIViewController.swift
//  Grail Diary
//
//  Created by Niranjan Kumar on 10/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
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
    
    var delegate: AddPOIDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = locationTextField.text , let country = countryTextField.text, !location.isEmpty, !country.isEmpty else { return }
        
        var newPOI = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1TextField.text, !clue1.isEmpty {
            newPOI.clues.append(clue1)
        }
        if let clue2 = clue2TextField.text, !clue2.isEmpty {
                  newPOI.clues.append(clue2)
              }
        if let clue3 = clue3TextField.text, !clue3.isEmpty {
                  newPOI.clues.append(clue3)
              }
        
        delegate?.poiWasAdded(newPOI)
    }

}


extension AddPOIViewController: UITextFieldDelegate {
    
}


//Implement the delegate method textFieldShouldReturn(_:); unwrap the text and make sure it's not empty, then switch off the textfield to determine which one called this method; change the firstResponder status to the appropriate textfield
