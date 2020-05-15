//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Violet Lavender Love on 5/14/20.
//  Copyright © 2020 Love. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func POIWasAdded(poi: POI)
}



class AddPOIViewController: UIViewController {
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var countryTextField: UITextField!
    @IBOutlet var clue1TextField: UITextField!
    @IBOutlet var clue2TextField: UITextField!
    @IBOutlet var clue3TextField: UITextField!
    
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveTapped(_ sender: Any) {
        guard let location =  locationTextField.text,
            let country = countryTextField.text else { return }
                
                var clues: [String] = []
                
                if  let clue1 = clue1TextField.text,
                    clue1 != "" {
                    clues.append(clue1)
                }
                if  let clue2 = clue2TextField.text,
                    clue2 != "" {
                    clues.append(clue2)
                }
                if  let clue3 = clue3TextField.text,
                    clue3 != "" {
                    clues.append(clue3)
                }
       
        let poi = POI(location: location, country: country, clues: clues)
        delegate?.POIWasAdded(poi: poi)
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
    
}
