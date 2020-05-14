//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Ian Becker on 5/14/20.
//  Copyright © 2020 Ian Becker. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    @IBOutlet weak var locationVC: UITextField!
    @IBOutlet weak var countryVC: UITextField!
    @IBOutlet weak var clue1VC: UITextField!
    @IBOutlet weak var clue2VC: UITextField!
    @IBOutlet weak var clue3VC: UITextField!
    
    var delegate: AddPOIDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: Any) {
        
        guard let location = locationVC.text, let country = countryVC.text else { return }
        
        var clues: [String] = []
        
        if let clue1 = clue1VC.text, clue1 != "" {
            clues.append(clue1)
        }
        if let clue2 = clue2VC.text, clue2 != "" {
            clues.append(clue2)
        }
        if let clue3 = clue3VC.text, clue3 != "" {
        clues.append(clue3)
        }
        
        let poi = POI(location: location, country: countryVC, clues: clues)
        
        delegate?.poiWasAdded(poi)
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancel(_ sender: Any) {
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
    }
}
