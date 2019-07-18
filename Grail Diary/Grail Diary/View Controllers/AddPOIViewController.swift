//
//  AddPOIViewController.swift
//  Grail Diary
//
//  Created by brian vilchez on 7/17/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class AddPOIViewController: UIViewController {
    @IBOutlet weak var countryLabel: UITextField!
    
    @IBOutlet weak var clues3TextField: UITextField!
    @IBOutlet weak var clues2TextField: UITextField!
    @IBOutlet weak var clues1Textfield: UITextField!
    @IBOutlet weak var locationLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func SaveButton(_ sender: UIBarButtonItem) {
    }
}
