//
//  AddPOIViewController.swift
//  grail diary part 1
//
//  Created by brian vilchez on 8/14/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class AddPOIViewController: UIViewController {
    
    //MARK: - properties
    
    var POIDelegate: CreatePOI?
    @IBOutlet weak var countrytextfield:UITextField!
    @IBOutlet weak var locationtextfield:UITextField!
    @IBOutlet weak var clue1textfield:UITextField!
    @IBOutlet weak var clue2textfield:UITextField!
    @IBOutlet weak var clue3textfield:UITextField!
    
    //MARK: - actions
    @IBAction func saveButtonTapped(_ sender:UITabBarItem) {
        
        guard let country = countrytextfield.text,!country.isEmpty,
            let location = locationtextfield.text,!location.isEmpty else {return}
            var poi = POI(location: location, country: country)
        
        if let clue1 = clue1textfield.text,!clue1.isEmpty {
            poi.clues.append(clue1)
        }
        if let clue2 = clue2textfield.text,!clue2.isEmpty {
            poi.clues.append(clue2)
        }
        if let clue3 = clue3textfield.text, !clue3.isEmpty {
            poi.clues.append(clue3)
        }
        POIDelegate?.createPOI(poi: poi)
    }
    
    @IBAction func cancelButtonTapped(_ sender:UITabBarItem) {
        dismiss(animated: true, completion: nil)
    }
}
