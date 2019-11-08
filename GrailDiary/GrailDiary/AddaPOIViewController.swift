//
//  AddaPOIViewController.swift
//  GrailDiary
//
//  Created by Zack Larsen on 11/7/19.
//  Copyright © 2019 Zack Larsen. All rights reserved.
//

import UIKit
protocol addPOIDelegate: class {
func poiWasAdded(_poi: POI)
    
}






class AddaPOIViewController: UIViewController {
    
    var delegate: addPOIDelegate?
    
    @IBOutlet weak var addLocationCell: UITextField!
    @IBOutlet weak var addCountry: UITextField!
    
    @IBOutlet weak var addClue1: UITextField!
    @IBOutlet weak var addClue2: UITextField!
    
    @IBOutlet weak var addClue3: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        }
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveTapped(_ sender: Any) {
        guard let location = addLocationCell.text,
            let country = addCountry.text  else  { return }
    
        var savedPoi = POI(location: location, country: country, clues: [])
        
        
        if let clue1 = addClue1.text,
        !clue1.isEmpty {
            savedPoi.clues.append(clue1)
            
        }
        if let clue2 = addClue2.text,
        !clue2.isEmpty {
            savedPoi.clues.append(clue2)
            
        }
            if let clue3 = addClue3.text,
                !clue3.isEmpty {
             savedPoi.clues.append(clue3)
                    
        }
    }
}
    
    
    

        // Do any additional setup after loading the vi
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
