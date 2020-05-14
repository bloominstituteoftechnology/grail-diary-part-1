//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Violet Lavender Love on 5/14/20.
//  Copyright © 2020 Love. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func POIWasAdded(poi: POI)
}



class AddPOIViewController: UIViewController {
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var countryTextField: UITextField!
    @IBOutlet var clue1TextField: UITextField!
    @IBOutlet var clue2TextField: UITextField!
    @IBOutlet var clue3TextField: UITextField!
    
    
    
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
