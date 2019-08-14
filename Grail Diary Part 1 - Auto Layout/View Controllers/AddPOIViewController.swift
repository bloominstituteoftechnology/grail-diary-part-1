//
//  AddPOIViewController.swift
//  Grail Diary Part 1 - Auto Layout
//
//  Created by Andrew Ruiz on 8/14/19.
//  Copyright © 2019 Andrew Ruiz. All rights reserved.
//

import UIKit

protocol AddPoiDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {

    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    var delegate: AddPoiDelegate?
    
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
    
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        
        guard let locationText = locationTextField.text,
            let countryText = countryTextField.text else { return }
        
        var poi = POI(location: locationText, country: countryText, clues: [])
        
        if let clue1 = clue1TextField.text {
            poi.clues.append(clue1)
        }
        
        if let clue2 = clue2TextField.text {
            poi.clues.append(clue2)
        }
        
        if let clue3 = clue3TextField.text {
            poi.clues.append(clue3)
        }
        
        delegate?.poiWasAdded(poi)
        
    }

}


extension AddPOIViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let unwrappedText = textField.text {
            
            switch textField {
            case locationTextField:
                countryTextField.becomeFirstResponder()
            case countryTextField:
                clue1TextField.becomeFirstResponder()
            case clue1TextField:
                clue2TextField.becomeFirstResponder()
            case clue3TextField:
                clue3TextField.becomeFirstResponder()
            default:
                textField.becomeFirstResponder()
            }
        }
    }
}
