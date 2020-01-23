//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Lambda_School_Loaner_254 on 1/23/20.
//  Copyright © 2020 Rebecca Roshon. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
    
}

class AddPOIViewController: UIViewController {
    @IBOutlet weak var LocationLabel: UITextField!
    @IBOutlet weak var countryLabel: UITextField!
    @IBOutlet weak var clue2Label: UITextField!
    @IBOutlet weak var clue1Label: UITextField!
    @IBOutlet weak var clue3Label: UITextField!
    
    var delegate: AddPOIDelegate?
    
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
