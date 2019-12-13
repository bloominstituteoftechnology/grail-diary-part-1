//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Jorge Alvarez on 12/12/19.
//  Copyright © 2019 Jorge Alvarez. All rights reserved.
//

import UIKit

// 13 done
protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    // 12 done
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    // 15 done
    @IBAction func cancelTapped(_ sender: Any) {
        
    }
    
    @IBAction func saveTapped(_ sender: Any) {
    }
    
    // 14 done
    var delegate: AddPOIDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

//extension AddFriendViewController: UITextFieldDelegate {
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        // dismisses the keyboard
//        textField.resignFirstResponder()
//        return true
//    }
//}
