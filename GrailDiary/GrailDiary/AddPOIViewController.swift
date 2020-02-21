//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Bhawnish Kumar on 2/20/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

import UIKit
protocol AddPOIDelegate {
    func poiWasAdded(poi: POI)
}

class AddPOIViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clueTextField1: UITextField!
    @IBOutlet weak var clueTextField2: UITextField!
    @IBOutlet weak var clueTextField3: UITextField!
    
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func save(_ sender: Any) {
        guard let location = locationTextField.text,
            let country = countryTextField.text else { return }
        var pois: [String] = []
        if let poi1 = clueTextField1.text,
            !poi1.isEmpty {
            pois.append(poi1)
        }
        if let poi2 = clueTextField2.text,
            !poi2.isEmpty {
            pois.append(poi2)
        }
        if let poi3 = clueTextField3.text,
            !poi3.isEmpty {
            pois.append(poi3)
        }
        
        let addPoi = POI(location: location, country: country, clues: pois)
        
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
