//
//  AddPOIViewController.swift
//  GrailDairy
//
//  Created by Waseem Idelbi on 11/21/19.
//  Copyright © 2019 Waseem Idelbi. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(poi: POI)
    
}
class AddPOIViewController: UIViewController {

    @IBOutlet var locationLabel: UITextField!
    @IBOutlet var countryLabel: UITextField!
    @IBOutlet var clue1Label: UITextField!
    @IBOutlet var clue2Label: UITextField!
    @IBOutlet var clue3Label: UITextField!
    
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveTapped(_ sender: Any) {
        
        guard let location = locationLabel.text,
            let country = countryLabel.text,
            
            !location.isEmpty,
            !country.isEmpty else {return}
        
        var poi = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1Label.text {
            !clue1.isEmpty
            poi.clues.append(clue1)
        }
        if let clue2 = clue2Label.text {
            !clue2.isEmpty
            poi.clues.append(clue2)
        }
        if let clue3 = clue3Label.text {
            !clue3.isEmpty
            poi.clues.append(clue3)
        }
        delegate?.poiWasAdded(poi: poi)
        
        
    }
    
    var delegate: AddPOIDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text,
        !text.isEmpty {
            switch textField {
            case locationLabel:
                countryLabel.becomeFirstResponder()
            case countryLabel:
                clue1Label.becomeFirstResponder()
            case clue1Label:
                clue2Label.becomeFirstResponder()
            case clue2Label:
                clue3Label.becomeFirstResponder()
            case clue3Label:
                locationLabel.becomeFirstResponder()
            
            default:
                break
            }
        }
    }
}
