//
//  AddPOIViewController.swift
//  GrailDairy
//
//  Created by denis cedeno on 9/26/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clueOneTextField: UITextField!
    @IBOutlet weak var clueThreeTextField: UITextField!
    @IBOutlet weak var clueTwoTextField: UITextField!
    
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

     @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func saveTapped(_ sender: Any) {
        guard let location = locationTextField.text, !location.isEmpty,
        let country = countryTextField.text, !country.isEmpty else {
            return
        }
        var poi = POI(location: location, country: country)
        
        if let clue1 = clueOneTextField.text, !clue1.isEmpty {
            poi.clues.append(clue1)
        }
        if let clue2 = clueTwoTextField.text, !clue2.isEmpty {
            poi.clues.append(clue2)
        }
        if let clue3 = clueThreeTextField.text, !clue3.isEmpty {
            poi.clues.append(clue3)
        }
        
        delegate?.poiWasAdded(poi)
        
    }
}
    // MARK: - Text Field Delegation

extension AddPOIViewController: UITextFieldDelegate {
    
}


