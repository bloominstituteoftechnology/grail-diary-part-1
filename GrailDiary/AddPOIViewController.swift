//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Lambda_School_Loaner_268 on 1/27/20.
//  Copyright © 2020 Jeremiah. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}
var delegate: AddPOIDelegate?
class AddPOIViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var Location: String
    @IBOutlet weak var Country: String
    @IBOutlet weak var Clue1: String
    @IBOutlet weak var Clue2: String
    @IBOutlet weak var Clue3: String
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard Country,Location, Clue1, Clue2, Clue3 {
            let entry = POI(location: Location, country: Country, clues: [Clue1, Clue2, Clue3]
        
        } else {
            cancelTapped(animated: true, completion: false)
        }
        
    }
@IBAction cancelTapped(_ sender: UIBarButtonItem) {
    self.dismiss(animated: true, completion: false)
    }


    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


