//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Bryan Cress on 5/14/20.
//  Copyright © 2020 Bryan Cress. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func POIWasAdded(poi: POI)
}



class AddPOIViewController: UIViewController {
    
    @IBOutlet weak var LocationTextField: UITextField!
    @IBOutlet weak var CountryTextField: UITextField!
    @IBOutlet weak var Clue1TextField: UITextField!
    @IBOutlet weak var Clue2TextField: UITextField!
    @IBOutlet weak var Clue3TextField: UITextField!
    
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        
        guard let location = LocationTextField.text,
            let country = CountryTextField.text else { return }
        
        var clues: [String] = []
        
        if let clue1 = Clue1TextField.text,
                clue1 != "" {
                clues.append(clue1)
            }

             if let clue2 = Clue2TextField.text,
                           clue2 != "" {
                           clues.append(clue2)
                       }
        
            if let clue3 = Clue3TextField.text,
                           clue3 != "" {
                           clues.append(clue3)
                       }
                //POI Object
        let poi = POI(location: location, country: country, clues: clues)
        
        
        delegate?.POIWasAdded(poi: poi)
        dismiss(animated: true, completion: nil)
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
//extension AddPOIViewController: UITextFieldDelegate {
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if case let textfield != "" {
//            switch <#value#> {
//            case <#pattern#>:
//                <#code#>
//            default:
//                <#code#>
//        }
//        }
//    }
//}
