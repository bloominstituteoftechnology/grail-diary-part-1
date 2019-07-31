//
//  AddPOIViewController.swift
//  Grail Diary Part 1 - Auto Layout
//
//  Created by Nicolas Rios on 7/17/19.
//  Copyright © 2019 Nicolas Rios. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
  func  poiWasAdded(_ poi: POI)
}
class AddPOIViewController: UIViewController {
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    var delegate:AddPOIDelegate?
   
    @IBAction func cancelTapped(_sender:UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
   
     @IBAction func saveTapped(_ sender: UIBarButtonItem) {
     guard let location = locationTextField.text
        let country = countryTextField.text
        !location.isEmpty,
        !country.isEmpty else { return }
        
        
        if let
        
        
        
    



