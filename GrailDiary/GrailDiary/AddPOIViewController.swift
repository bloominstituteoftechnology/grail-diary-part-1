//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Mark Poggi on 3/19/20.
//  Copyright © 2020 Mark Poggi. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded (_ poi: POI)
}




class AddPOIViewController: UIViewController {
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clues1TextField: UITextField!
    @IBOutlet weak var clues2TextField: UITextField!
    @IBOutlet weak var clues3TextField: UITextField!
    
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        // grab the location & country
        
        guard let newLocation = locationTextField.text,
            let country = countryTextField.text else { return }
        
        // grab the hobbies
        
        var newClues: [String] = []
        
        if let clue1 = clues1TextField.text,
            !clue1.isEmpty {
            newClues.append(clue1)
        }
        
        if let clue2 = clues2TextField.text,
            !clue2.isEmpty {
            newClues.append(clue2)
        }
        
        if let clue3 = clues3TextField.text,
            !clue3.isEmpty {
            newClues.append(clue3)
        }
        
        
        // cfreate the POI
        
        let newpoi = POI(location: newLocation, country: country, clues: newClues)
        
        
        // pass the POI back to POIsTableViewController
        
        delegate?.poiWasAdded(newpoi)
        dismiss(animated: true, completion: nil)
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
//        textFieldShouldReturn(_ textField: UITextField) -> Bool
    }
    
    
