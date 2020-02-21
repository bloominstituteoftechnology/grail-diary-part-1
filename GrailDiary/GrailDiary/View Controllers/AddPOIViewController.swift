//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Shawn James on 2/20/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {

    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var countryField: UITextField!
    @IBOutlet weak var firstClueField: UITextField!
    @IBOutlet weak var secondClueField: UITextField!
    @IBOutlet weak var thirdClueField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var delegate: AddPOIDelegate?

    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = locationField.text else { return }
        guard let country = countryField.text else { return }
        
        var poiInit = POI(location: location, country: country, clues: [])
        
        if let clue1 = firstClueField.text {
            poiInit.clues.append(clue1)
        }
        if let clue2 = secondClueField.text {
            poiInit.clues.append(clue2)
        }
        if let clue3 = thirdClueField.text {
            poiInit.clues.append(clue3)
        }
        
        delegate?.poiWasAdded(poiInit)
        
        dismiss(animated: false, completion: nil)
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
        case locationField:
            countryField.becomeFirstResponder()
        case countryField:
            firstClueField.becomeFirstResponder()
        case firstClueField:
            secondClueField.becomeFirstResponder()
        case secondClueField:
            thirdClueField.becomeFirstResponder()
        case thirdClueField:
            return true
        default:
            return true
        }
        return true
}

// check step 20-21 if problems
}
