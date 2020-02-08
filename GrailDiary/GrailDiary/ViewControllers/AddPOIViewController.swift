//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Rick Wolter on 10/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol AddPOIDelegate{
    func poiWasAdded(_ poi: POI)
}



class AddPOIViewController: UIViewController, UITextFieldDelegate {

    
    var delegate: AddPOIDelegate?
    
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem){
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem){
        
        guard let location = locationTextField.text, let country = countryTextField.text else { return  }
        
        var poi = POI(location: location, country: country, clues: [])
        
        if let clues1 = clue1TextField.text, !clues1.isEmpty{
            poi.clues.append(clues1)
        }
        if let clues2 = clue2TextField.text, !clues2.isEmpty{
            poi.clues.append(clues2)
        }
        if let clues3 = clue3TextField.text, !clues3.isEmpty{
            poi.clues.append(clues3)
        }
        
        delegate?.poiWasAdded(poi)
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        <#code#>
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

