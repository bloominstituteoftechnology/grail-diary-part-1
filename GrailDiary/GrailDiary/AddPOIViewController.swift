//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Vincent Hoang on 4/16/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController, UITextFieldDelegate {

    
    
    @IBOutlet var locationTextField: UITextField?
    @IBOutlet var countryTextField: UITextField?
    @IBOutlet var firstClue: UITextField?
    @IBOutlet var secondClue: UITextField?
    @IBOutlet var thirdClue: UITextField?
    
    var delegate: AddPOIDelegate?
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let unwrappedLocation = locationTextField?.text,
            let unwrappedCountry = countryTextField?.text else {
                dismiss(animated: true, completion: nil)
                return
        }
        
        var pointOfInterest = POI(location: unwrappedLocation, country: unwrappedCountry, clues: [String]())
        
        if let unwrappedFirstClue = firstClue?.text {
            pointOfInterest.clues.append(unwrappedFirstClue)
        }
        
        if let unwrappedSecondClue = secondClue?.text {
            pointOfInterest.clues.append(unwrappedSecondClue)
        }
        
        if let unwrappedThirdClue = thirdClue?.text {
            pointOfInterest.clues.append(unwrappedThirdClue)
        }
        
        delegate?.poiWasAdded(pointOfInterest)
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text != nil {
            resignFirstResponder()
            switch textField {
            case locationTextField:
                countryTextField?.becomeFirstResponder()
            case countryTextField:
                firstClue?.becomeFirstResponder()
            case firstClue:
                secondClue?.becomeFirstResponder()
            case secondClue:
                thirdClue?.becomeFirstResponder()
            case thirdClue:
                self.view.endEditing(true)
            default:
                fatalError("Error in assigning first responder to next textField")
            }
            return true
        }
        return false
    }

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
