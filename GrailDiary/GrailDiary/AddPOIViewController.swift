//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by beth on 1/23/20.
//  Copyright © 2020 elizabeth wingate. All rights reserved.
//

import UIKit

protocol AddGrail {
    func POIWasAdded(_ pointsOfInterest: POI)
}

class AddPOIViewController: UIViewController {

    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!

    var delegate: AddPOIInterest?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func savePressed(_ sender: Any) {
         guard let location: String = locationTextField.text, let country = countryTextField.text, !location.isEmpty, !country.isEmpty else { return }
}
}
  
