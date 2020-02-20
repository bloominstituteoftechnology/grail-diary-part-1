//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Wyatt Harrell on 2/20/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
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

    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        
        guard let location = locationTextField.text, let country = countryTextField.text else { return }
        
        var clues: [String] = []
        
        
        if let clue1 = clue3TextField.text {
            clues.append(clue1)
        }
        
        if let clue2 = clue3TextField.text {
            clues.append(clue2)
        }
        
        if let clue3 = clue3TextField.text {
            clues.append(clue3)
        }
        
        let newPOI = POI(location: location, country: country, clues: clues)
        
        delegate?.poiWasAdded(newPOI)
    }
    
    
}

extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        <#code#>
    }
}
