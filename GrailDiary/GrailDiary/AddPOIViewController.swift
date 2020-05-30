//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by John McCants on 5/19/20.
//  Copyright © 2020 John McCants. All rights reserved.
//

import UIKit

//protocol AddPOIDelegate {
//    func poiWasAdded(_ poi: POI)
//}

class AddPOIViewController: UIViewController {

    @IBOutlet weak var clueOne: UITextField!
    
    @IBOutlet weak var clueTwo: UITextField!
    
    @IBOutlet weak var clueThree: UITextField!
    
    @IBOutlet weak var countryField: UITextField!
    
    @IBOutlet weak var locationField: UITextField!
    
    var delegate : AddPOIDelegate?
    
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
    
 
    
    @IBAction func cancelTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        
        guard let unwrappedLocation = self.locationField.text, !unwrappedLocation.isEmpty, let unwrappedCountry = self.countryField.text, !unwrappedCountry.isEmpty else {
            return
        }
        
        var poi = POI(location: unwrappedLocation, country: unwrappedCountry)
        
        if let unwrappedClue = self.clueOne.text, !unwrappedClue.isEmpty {
            poi.clues.append(unwrappedClue)
        }
        
        if let unwrappedClue2 = self.clueTwo.text, !unwrappedClue2.isEmpty {
            poi.clues.append(unwrappedClue2)
        }
        if let unwrappedClue3 = self.clueThree.text, !unwrappedClue3.isEmpty {
            poi.clues.append(unwrappedClue3)
            }
            delegate?.poiWasAdded(poi)
            print("saveTapped unwrapping working")
            
        }
}
        

extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text,
            !text.isEmpty {
            switch textField {
            case locationField:
                countryField.becomeFirstResponder()
            case countryField:
                clueOne.becomeFirstResponder()
            case clueOne:
              clueTwo.becomeFirstResponder()
            case clueTwo:
                clueThree.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
            }
        }
        
        return false
    }
}
