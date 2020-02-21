//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Bhawnish Kumar on 2/20/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

import UIKit
protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}
class AddPOIViewController: UIViewController {
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextLabel: UITextField!
    @IBOutlet weak var clueTextField1: UITextField!
    @IBOutlet weak var clueTextField2: UITextField!
    @IBOutlet weak var clueTextField3: UITextField!
    
    var delegate = AddPOIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: Any) {
    }
    @IBAction func save(_ sender: Any) {
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
