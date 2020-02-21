//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Harmony Radley on 2/20/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
    
}


class AddPOIViewController: UIViewController {
    
    
   
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var delegate: AddPOIDelegate?
   
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
        
    }
   
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        
        guard let location = locationTextField.text,
            let country = countryTextField.text else
                { return }
       var poi = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1TextField.text,
            !clue1.isEmpty {
            poi.clues.append(clue1)
        }
        if let clue2 = clue2TextField.text,
            !clue2.isEmpty {
            poi.clues.append(clue2)
        }
        if let clue3 = clue3TextField.text,
            !clue3.isEmpty {
            poi.clues.append(clue3)
        }
        delegate?.poiWasAdded(poi)
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
        
        }
}
