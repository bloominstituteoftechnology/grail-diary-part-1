//
//  AddPOIViewController.swift
//  Grail-Diary
//
//  Created by Breena Greek on 2/5/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasCreated(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var locationLabel: UITextField!
    @IBOutlet weak var countryLabel: UITextField!
    @IBOutlet weak var clue1Label: UITextField!
    @IBOutlet weak var clue2Label: UITextField!
    @IBOutlet weak var clue3Label: UITextField!
    
    //Properties
    
    var delegate: AddPOIDelegate?
    
    // MARK: IBActions
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
    self.dismiss(animated: true, completion: nil)
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
          delegate?.poiWasCreated(poi)
           
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [locationLabel, countryLabel, clue1Label, clue2Label, clue3Label] .forEach{$0.delegate = self}

    }

}

extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let text = textField.text, !text.isEmpty {
            switch textField {
            case locationLabel: countryLabel
                .becomeFirstResponder()
            case countryLabel: clue1Label.becomeFirstResponder()
            case clue1Label: clue2Label.becomeFirstResponder()
            case clue2Label: clue3Label.becomeFirstResponder()
                
            default: locationLabel.becomeFirstResponder() 
                
            }
            
        }
        return false
    }
}
