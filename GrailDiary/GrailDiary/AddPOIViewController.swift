//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Mark Gerrior on 2/20/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {

    var delegate: AddPOIDelegate?
    
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var countryField: UITextField!
    @IBOutlet weak var clue1Field: UITextField!
    @IBOutlet weak var clue2Field: UITextField!
    @IBOutlet weak var clue3Field: UITextField!
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        guard let loc = locationField.text,
            let country = countryField.text else { return }
        
        var clues = [String]()
        var poi = POI(location: loc, country: country, clues: clues)

        guard let clue1 = clue1Field.text,
            let clue2 = clue2Field.text,
            let clue3 = clue3Field.text else {
                // Something is wrong with 1 or more clues. Save what we got.
                delegate?.poiWasAdded(poi)
                return
        }

        if clue1.count > 1 { clues.append(clue1) }
        if clue2.count > 1 { clues.append(clue2) }
        if clue3.count > 1 { clues.append(clue3) }

        poi.clues = clues
        
        delegate?.poiWasAdded(poi)

        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        <#code#>
        return true
    }
}
