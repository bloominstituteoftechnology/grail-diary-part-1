//
//  AddPOIViewController.swift
//  Grail Diary
//
//  Created by William Chen on 8/14/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasCreated(_ poi: POI)
   
}

class AddPOIViewController: UIViewController {
    
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var countryTextField: UITextField!
    
    @IBOutlet weak var clue1TextField: UITextField!
    
    @IBOutlet weak var clue2TextField: UITextField!
    
    @IBOutlet weak var clue3TextField: UITextField!
    
    var delegate:AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        guard let location = locationTextField.text,
        let country = countryTextField.text,
        !location.isEmpty,
        !country.isEmpty else{return}
        
        var poi = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1TextField.text, !clue1.isEmpty {
            poi.clues.append(clue1)
        }
        if let clue2 = clue2TextField.text, !clue2.isEmpty {
            poi.clues.append(clue2)
            
        if let clue3 = clue3TextField.text, !clue3.isEmpty {
            poi.clues.append(clue3)
            }
        delegate?.poiWasCreated(poi)
            
        }
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

/*
extension AddPOIViewController: UITextFieldDelegate{
    private func textFieldShouldReturn(_ textField: UITextField){
        if let textFieldShouldReturn = textField.text, !textFieldShouldReturn.isEmpty{
            switch textField{
            case locationTextField.becomeFirstResponder()
            case countryTextField.becomeFirstResponder()
                countryTextField.isFirstResponder = true
                
            }
        }
        
    
    }

}

 */
