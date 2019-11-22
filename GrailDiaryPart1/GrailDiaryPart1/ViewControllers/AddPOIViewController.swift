//
//  AddPOIViewController.swift
//  GrailDiaryPart1
//
//  Created by Chris Price on 11/21/19.
//  Copyright © 2019 Chris Price. All rights reserved.
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
    @IBOutlet weak var clue3TexField: UITextField!
    
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
           super.viewDidLoad()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
        
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let location = locationTextField.text,
            let country = countryTextField.text,
            !location.isEmpty,
            !country.isEmpty else { return }
        
        var poi = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1TextField.text,
            !clue1.isEmpty {
            
        }
        
    }
}
