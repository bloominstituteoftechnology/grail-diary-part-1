//
//  AddPOIViewController.swift
//  GrailDairy
//
//  Created by Juan M Mariscal on 2/5/20.
//  Copyright © 2020 Juan M Mariscal. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}



class AddPOIViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    
    // MARK: Private Properties
    var delegate: AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
