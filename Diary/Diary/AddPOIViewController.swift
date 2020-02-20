//
//  AddPOIViewController.swift
//  Diary
//
//  Created by Lydia Zhang on 2/20/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import UIKit
protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}
class AddPOIViewController: UIViewController, UITextFieldDelegate {

    var delegate: AddPOIDelegate?
    
    @IBOutlet weak var locationLabel: UITextField!
    @IBOutlet weak var countryLabel: UITextField!
    @IBOutlet weak var clue1Label: UITextField!
    @IBOutlet weak var clue2Label: UITextField!
    @IBOutlet weak var clue3Label: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = locationLabel.text, let country = countryLabel.text else { return }
        var clues: [String] = []
        if let clue1 = clue1Label.text, !clue1.isEmpty {
            clues.append(clue1)
        }
        if let clue2 = clue2Label.text, !clue2.isEmpty {
            clues.append(clue2)
        }
        if let clue3 = clue3Label.text, !clue3.isEmpty {
            clues.append(clue3)
        }
        let poi = POI(location: location, country: country, clue: clues)
        delegate?.poiWasAdded(poi)
        
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
