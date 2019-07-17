//
//  AddPOIViewController.swift
//  GrailDiary1
//
//  Created by Taylor Lyles on 7/17/19.
//  Copyright © 2019 Taylor Lyles. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
	func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
	
	@IBOutlet weak var locatinTextField: UITextField!
	@IBOutlet weak var countryTextField: UITextField!
	@IBOutlet weak var clue1TextField: UITextField!
	@IBOutlet weak var clue2TextField: UITextField!
	@IBOutlet weak var clue3TextField: UITextField!
	
	var delegate: AddPOIDelegate?
	
	@IBAction func cancelTapped(_ sender: UIBarButtonItem) {
		dismiss(animated: true, completion: nil)
	}
	@IBAction func saveTapped(_ sender: UIBarButtonItem) {
		guard let location = locatinTextField.text,
			let country = countryTextField.text,
			!location.isEmpty,
			!country.isEmpty else { return }
		
		var clue = POI(location: location, country: country, clues: [])
		
		if let clue1 = clue1TextField.text,
			!clue1.isEmpty {
			clue.clues.append(clue1)
		}
		
		if let clue2 = clue2TextField.text,
			!clue2.isEmpty {
			clue.clues.append(clue2)
		}
		
		if let clue3 = clue3TextField.text,
			!clue3.isEmpty {
			clue.clues.append(clue3)
		}
		
		delegate?.poiWasAdded(clue)
		
		
	}

}

extension AddPOIViewController: UITableViewDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if let text = textField.text,
			!text.isEmpty {
			switch textField {
			case locatinTextField:
				countryTextField.becomeFirstResponder()
			case countryTextField:
				clue1TextField.becomeFirstResponder()
			case clue1TextField:
				clue2TextField.becomeFirstResponder()
			case clue2TextField:
				clue3TextField.becomeFirstResponder()
			default:
				textField.resignFirstResponder()
			}
		}
		
		return false
	}
}
