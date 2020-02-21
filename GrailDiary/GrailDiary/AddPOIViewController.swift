//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Mark Gerrior on 2/20/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {

    var delegate: AddPOIDelegate?
    
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var countryField: UITextField!
    @IBOutlet weak var clue1Field: UITextField!
    @IBOutlet weak var clue2Field: UITextField!
    @IBOutlet weak var clue3Field: UITextField!
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        guard let loc = locationField.text,
            let country = countryField.text else { return }
        
        var clues = [String]()
        var poi = POI(location: loc, country: country, clues: clues)

        if let clue = clue1Field.text,
            !clue.isEmpty {
            clues.append(clue)
        }

        if let clue = clue2Field.text,
            !clue.isEmpty {
            clues.append(clue)
        }

        if let clue = clue3Field.text,
            !clue.isEmpty {
            clues.append(clue)
        }

        poi.clues = clues
        
        delegate?.poiWasAdded(poi)

        //FIXME: Does this go here or in the delegate?
        dismiss(animated: true, completion: nil)
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

extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let empty = (textField.text?.count == 0) 
        
        switch textField {
        case locationField:
            if !empty { countryField.becomeFirstResponder()}
        case countryField:
            if !empty { clue1Field.becomeFirstResponder()}
        case clue1Field:
            if !empty { clue2Field.becomeFirstResponder()}
        case clue2Field:
            if !empty { clue3Field.becomeFirstResponder()}
        case clue3Field:
            fallthrough
        default:
            becomeFirstResponder()
        }
        return true
    }
}
