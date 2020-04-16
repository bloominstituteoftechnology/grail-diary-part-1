//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Nonye on 4/16/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import UIKit
//MARK: PROTOCOL
protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

@IBDesignable
class AddPOIViewController: UIViewController {
    
//MARK: OUTLETS FOR TEXT FIELDS
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    var delegate: AddPOIDelegate?

//MARK: SAVE & CANCEL OUTLETS

    @IBAction func cancelTapped(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        guard let locationTextField = locationTextField.text,
                   let countryTextField = countryTextField.text else { return }
        
        
    var thePOI = POI(location: locationTextField, country: countryTextField, clues: [String]())

        if let clue1 = clue1TextField?.text {
            thePOI.clues.append(clue1)
        }
        if let clue2 = clue2TextField?.text {
            thePOI.clues.append(clue2)
        if let clue3 = clue3TextField?.text {
            thePOI.clues.append(clue3)
        }
            
    }
    
        delegate?.poiWasAdded(thePOI)
        dismiss(animated: true, completion: nil)
    
    }

    
   
    


    override func viewDidLoad() {
        super.viewDidLoad()


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
