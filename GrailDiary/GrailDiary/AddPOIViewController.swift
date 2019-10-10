//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by morse on 10/9/19.
//  Copyright © 2019 morse. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var countryTextField: UITextField!
    @IBOutlet var clue1TextField: UITextField!
    @IBOutlet var clue2TextField: UITextField!
    @IBOutlet var clue3TextField: UITextField!
    
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        guard let location = locationTextField.text, let country = countryTextField.text else { return }
        
        var newPOI = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1TextField.text {
            newPOI.clues.append(clue1)
        }
        if let clue2 = clue2TextField.text {
            newPOI.clues.append(clue2)
        }
            
        if let clue3 = clue3TextField.text {
            newPOI.clues.append(clue3)
        }
        
        delegate?.poiWasAdded(newPOI)
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
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
        
        guard let text = textField.text else { return false }
        return !text.isEmpty
    }
    
}
