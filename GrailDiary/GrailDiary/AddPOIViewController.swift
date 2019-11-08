//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Patrick Millet on 11/7/19.
//  Copyright © 2019 Patrick Millet. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(poi: POI)
}

class AddPOIViewController: UIViewController {

    @IBOutlet weak var locationOutlet: UITextField!
    @IBOutlet weak var countryOutlet: UITextField!
    @IBOutlet weak var clue1Outlet: UITextField!
    @IBOutlet weak var clue2Outlet: UITextField!
    @IBOutlet weak var clue3Outlet: UITextField!
    
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationOutlet.delegate = self
        countryOutlet.delegate = self
        clue1Outlet.delegate = self
        clue2Outlet.delegate = self
        clue3Outlet.delegate = self
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        
        guard let location = locationOutlet.text, let country = countryOutlet.text, !location.isEmpty, !country.isEmpty else {return}
        
        var poi = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1Outlet.text, !clue1.isEmpty {
            poi.clues.append(clue1)
        }
        if let clue2 = clue2Outlet.text, !clue2.isEmpty {
            poi.clues.append(clue2)
        }
        if let clue3 = clue3Outlet.text, !clue3.isEmpty {
            poi.clues.append(clue3)
        }
        
        delegate?.poiWasAdded(poi: poi)
    }
    
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}


    extension AddPOIViewController: UITextFieldDelegate {
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if let text = textField.text, !text.isEmpty {
                switch textField {
                case locationOutlet:
                    locationOutlet.becomeFirstResponder()
                case countryOutlet:
                    countryOutlet.becomeFirstResponder()
                case clue1Outlet:
                    clue1Outlet.becomeFirstResponder()
                case clue2Outlet:
                    clue2Outlet.becomeFirstResponder()
                case clue3Outlet:
                    clue3Outlet.becomeFirstResponder()
                default:
                    textField.resignFirstResponder()
                    
                }
            }
            return false
        }
    }
