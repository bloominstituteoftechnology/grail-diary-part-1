//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Shawn James on 3/19/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController  {

    // MARK: - Outlets
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    // MARK: - Properties
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func cancelTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func saveTapped(_ sender: Any) {
        guard let unwrappedLocation = locationTextField.text,
            let unwrappedCountry = countryTextField.text else { return }
        
        let cluesToUnwrap: [UITextField] = [clue1TextField, clue2TextField, clue3TextField]
        var unwrappedClues: [String] = []
        
        for clue in cluesToUnwrap {
            if let unwrappedClue = clue.text { unwrappedClues.append(unwrappedClue) }
            else { unwrappedClues.append("") }
        }
        
        delegate?.poiWasAdded(POI(location: unwrappedLocation, country: unwrappedCountry, clues: unwrappedClues))
        self.dismiss(animated: true, completion: nil)
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
        switch textField {
        case locationTextField: countryTextField.becomeFirstResponder()
        case countryTextField: clue1TextField.becomeFirstResponder()
        case clue1TextField: clue2TextField.becomeFirstResponder()
        case clue2TextField: clue3TextField.becomeFirstResponder()
        case clue3TextField: return true
        default: return true
        }
        return true
    }
}
