//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Thomas Bernard Leonard II on 10/10/19.
//  Copyright © 2019 Thomas Bernard Leonard II. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    var delegate: AddPOIDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = locationField.text,
            let country = countryTextField.text,
            !location.isEmpty,
            !country.isEmpty else { return }
        
        var newPOI = POI(location: location, country: country, clues: [])
        
        
        if let clue1 = clue1TextField .text,
            !clue1.isEmpty {
            newPOI.clues.append(clue1)
        }
        
        if let clue2 = clue2TextField .text,
                !clue2.isEmpty {
                newPOI.clues.append(clue2)
            }
        
        if let clue3 = clue3TextField .text,
                !clue3.isEmpty {
                newPOI.clues.append(clue3)
            }

        delegate?.poiWasAdded(newPOI)

}
}
//    extension AddPOIViewController: UITextFieldDelegate {
//
//}
