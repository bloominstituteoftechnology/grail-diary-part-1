//
//  AddPOIVC.swift
//  GrailDiary
//
//  Created by Norlan Tibanear on 5/27/20.
//  Copyright © 2020 Norlan Tibanear. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIVC: UIViewController {
    
    // Outlets
    @IBOutlet var newPOILabel: UILabel!
    @IBOutlet var cluesLabel: UILabel!
    
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var countryTextField: UITextField!
    @IBOutlet var clueOneTextField: UITextField!
    @IBOutlet var clueTwoTextField: UITextField!
    @IBOutlet var clueThreeTextField: UITextField!
    
    var delegate: AddPOIDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveButton_TouchUpInside(_ sender: UIBarButtonItem) {
        
        guard let location = locationTextField.text, !location.isEmpty else { return }
        guard let country = countryTextField.text, !country.isEmpty else { return }
        
        var places = POI(location: location, country: country, clues: [])
        
        if let clueOne = clueOneTextField.text, !clueOne.isEmpty {
            places.clues.append(clueOne)
        }
        if let clueTwo = clueTwoTextField.text, !clueTwo.isEmpty {
            places.clues.append(clueTwo)
        }
        if let clueThree = clueThreeTextField.text, !clueThree.isEmpty {
            places.clues.append(clueThree)
        }
        delegate?.poiWasAdded(places)
    }
    
    
    @IBAction func cancelButton_TouchUpInside(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    

} // END

