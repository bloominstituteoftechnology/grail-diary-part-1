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
