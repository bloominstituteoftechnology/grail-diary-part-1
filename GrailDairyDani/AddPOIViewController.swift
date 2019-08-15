//
//  AddPOIViewController.swift
//  GrailDairyDani
//
//  Created by Danielle Blackwell on 8/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)}

class AddPOIViewController: UIViewController {

    
    @IBOutlet weak var LocationLabel: UITextField!
    @IBOutlet weak var CountryLabel: UITextField!
    @IBOutlet weak var ClueLabel: UITextField!
    @IBOutlet weak var ClueLabel2: UITextField!
    @IBOutlet weak var ClueLabel3: UITextField!
    
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveTapped(_ sender: Any) {
        
        guard let location = LocationLabel.text,
        let country = CountryLabel.text,
        !location.isEmpty,
        !country.isEmpty else { return }
        
        var poi = POI(location: location, country: country, clues: [])
        
    if let clue1 = ClueLabel.text,
        !clue1.isEmpty {
        poi.clues.append(clue1)
        }
    if let clue2 = ClueLabel2.text,
        !clue2.isEmpty {
        poi.clues.append(clue2)
        }
    if let clue3 = ClueLabel3.text,
        !clue3.isEmpty {
        poi.clues.append(clue3)
        }
        
//        delegate?.POICreated(poi)
        
    }

}

extension UITextFieldDelegate {
    
}
