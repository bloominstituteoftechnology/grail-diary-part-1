//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Mike Nichols on 5/14/20.
//  Copyright © 2020 Mike Nichols. All rights reserved.
//

import UIKit

// #13
protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    // #12
    
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var clue1: UITextField!
    @IBOutlet weak var clue2: UITextField!
    @IBOutlet weak var clue3: UITextField!
    
    // #14
    
    var delegate: AddPOIDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // #15
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        
        // #16
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        
        // #17
        
        guard let location = location.text,
            let country = country.text else { return }
        
        var clues: [String] = []
        
        if let clue1 = clue1.text,
            clue1 != "" {
            clues.append(clue1)
        }
        
        if let clue2 = clue2.text,
            clue2 != "" {
            clues.append(clue2)
        }
        
        if let clue3 = clue3.text,
            clue3 != "" {
            clues.append(clue3)
        }
        
        let poi: POI = POI(location: location, country: country, clues: clues)
        
    // #18
        
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

// #19

extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let textField = textField.text,
            textField != "" else {
            return false
        }
        return true
        }
}

