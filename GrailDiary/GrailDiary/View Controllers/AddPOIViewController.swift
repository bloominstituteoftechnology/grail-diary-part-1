//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Ryan Dutson on 7/17/19.
//  Copyright © 2019 Ryan Dutson. All rights reserved.
//

import UIKit

class AddPOIViewController: UIViewController {

    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clues1TextField: UITextField!
    @IBOutlet weak var clues2TextField: UITextField!
    @IBOutlet weak var clues3TextField: UITextField!
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
    }
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
    }
}

extension AddPOIViewController: UITextFieldDelegate {
    
}
