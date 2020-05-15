//
//  AddPOIViewController.swift
//  Grail Diary
//
//  Created by Chris Gooley on 7/30/19.
//  Copyright © 2019 Chris Gooley. All rights reserved.
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
        
    }
    

    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
        
    }
 
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {

        guard let location = locationTextField.text,
              let country = countryTextField.text else { return }
        
        var poi = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1TextField.text, !clue1.isEmpty {
            poi.clues.append(clue1)
        }
        
        if let clue2 = clue2TextField.text, !clue2.isEmpty {
            poi.clues.append(clue2)
        }
        
        if let clue3 = clue3TextField.text, !clue3.isEmpty {
            poi.clues.append(clue3)
        }
        
        
        
    }
/*
    guard let name = nameTextField.text,
    let hometown = hometownTextField.text,
    !name.isEmpty,
    !hometown.isEmpty else { return }
    
    var friend = Friend(name: name, hometown: hometown, hobbies: [])
    
    if let hobby1 = hobby1TextField.text, !hobby1.isEmpty {
    friend.hobbies.append(hobby1)
    }
    
    if let hobby2 = hobby2TextField.text, !hobby2.isEmpty {
    friend.hobbies.append(hobby2)
    }
    
    if let hobby3 = hobby3TextField.text, !hobby3.isEmpty {
    friend.hobbies.append(hobby3)
    }
    
    delegate?.friendWasCreated(friend)
 
    

 */
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
