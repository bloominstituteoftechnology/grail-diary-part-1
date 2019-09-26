//
//  AddPOIViewController.swift
//  GrailDairy
//
//  Created by denis cedeno on 9/26/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clueOneTextField: UITextField!
    @IBOutlet weak var clueThreeTextField: UITextField!
    @IBOutlet weak var clueTwoTextField: UITextField!
    
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
