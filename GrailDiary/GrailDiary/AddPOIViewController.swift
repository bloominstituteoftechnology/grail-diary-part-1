//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Aaron Peterson on 4/16/20.
//  Copyright © 2020 Aaron Peterson. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_poi: POI)
}

class AddPOIViewController: UIViewController {

    @IBOutlet weak var locationTextfield: UITextField!
    @IBOutlet weak var countryTextfield: UITextField!
    @IBOutlet weak var clue1Textfield: UITextField!
    @IBOutlet weak var clue2Textfield: UITextField!
    @IBOutlet weak var clue3Textfield: UITextField!
    
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
