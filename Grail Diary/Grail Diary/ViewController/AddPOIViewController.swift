//
//  AddPOIViewController.swift
//  Grail Diary
//
//  Created by Percy Ngan on 8/14/19.
//  Copyright © 2019 Lamdba School. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
	func POICreated(_ poi: POI)
}
class AddPOIViewController: UIViewController {

	@IBOutlet weak var locationTextField: UITextField!
	@IBOutlet weak var countryTextField: UITextField!
	@IBOutlet weak var clue1TextField: UITextField!
	@IBOutlet weak var clue2TextField: UITextField!
	@IBOutlet weak var clue3TextField: UITextField!



	override func viewDidLoad() {
        super.viewDidLoad()

  
    }
    


}
