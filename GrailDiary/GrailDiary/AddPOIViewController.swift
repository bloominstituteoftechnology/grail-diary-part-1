//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Drew Miller on 5/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
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
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBOutlet weak var locationOutlet: UITextField!
    @IBOutlet weak var countryOutlet: UITextField!
    @IBOutlet weak var clue1Outlet: UITextField!
    @IBOutlet weak var clue2Outlet: UITextField!
    @IBOutlet weak var clue3Outlet: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
