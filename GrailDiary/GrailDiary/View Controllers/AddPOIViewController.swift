//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Richard Gibbs on 5/14/20.
//  Copyright © 2020 Rich Gibbs. All rights reserved.
//

import UIKit


protocol AddPOIDelegate {
    func POIWasCreated(poi: POI)
}

class AddPOIViewController: UIViewController {
    
    
    
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var countryTextField: UITextField!
    
    @IBOutlet weak var clue1TextField: UITextField!
    
    @IBOutlet weak var clue2TextField: UITextField!
    
    @IBOutlet weak var clue3TextField: UITextField!
    
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clue1TextField.delegate = self
        clue2TextField.delegate = self
        clue3TextField.delegate = self
        // Do any additional setup after loading the view.
        
        
        func textFieldShouldReturn(textField: UITextField!) -> Bool {   //delegate method
            clue1TextField.resignFirstResponder();
            clue2TextField.resignFirstResponder();
            clue3TextField.resignFirstResponder()
            

            return true
        }
    }
    

    @IBAction func save(_ sender: Any) {
        
        
        
        guard let location = locationTextField.text,
            let country = countryTextField.text else { return }
        
        
        var clues: [String] = []
        
        if let clue1 = clue1TextField.text,
            clue1 != "" {
            clues.append(clue1)
    }
        if let clue2 = clue2TextField.text,
                clue2 != "" {
                clues.append(clue2)
        }
        
        if let clue3 = clue3TextField.text,
                clue3 != "" {
                clues.append(clue3)
        }
        
        let poiObject = POI(location: location, country: country, clues: clues)
        
        delegate?.POIWasCreated(poi: poiObject)
        dismiss(animated: true, completion: nil)
        
        
    }
        
        
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
      textField.resignFirstResponder()

        return true
    }
}
