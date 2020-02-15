//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Jarren Campos on 2/14/20.
//  Copyright © 2020 Jarren Campos. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_poi: POI)
}

class AddPOIViewController: UIViewController {
    
    var delegate: AddPOIDelegate?
    // MARK: - IBOutlets
    
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var countryTextField: UITextField!
    @IBOutlet var clue1TextField: UITextField!
    @IBOutlet var clue2TextField: UITextField!
    @IBOutlet var clue3TextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - IBActions
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = locationTextField.text, let country = countryTextField.text, let clue1 = clue1TextField.text, let clue2 = clue2TextField.text, let clue3 = clue3TextField.text,
        !location.isEmpty,
        !country.isEmpty,
        !clue1.isEmpty,
        !clue2.isEmpty,
        !clue3.isEmpty,
    
            var item: POI = POI(location: location, country: country, clues: [])
            
            else {return}
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
