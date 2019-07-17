//
//  AddPOI_VC.swift
//  Grail Diary
//
//  Created by Jeffrey Santana on 7/17/19.
//  Copyright © 2019 Jefffrey Santana. All rights reserved.
//

import UIKit

protocol AddPOIVCDelegate {
	func addedNew(point: POI)
}

class AddPOI_VC: UIViewController {

	@IBOutlet weak var locationTextField: UITextField!
	@IBOutlet weak var countryTextField: UITextField!
	@IBOutlet var cluesTextFieldCollection: [UITextField]!
	
	var delegate: AddPOIVCDelegate?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configTextFields()
	}
	
	@IBAction func saveAction(_ sender: Any) {
		guard let location = locationTextField.optionalText else {
			let alert = UIAlertController(title: "Missing Content", message: "Please enter a location", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
			present(alert, animated: true, completion: nil)
			return
		}
		guard let country = countryTextField.optionalText else {
			let alert = UIAlertController(title: "Missing Content", message: "Please enter a country", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
			present(alert, animated: true, completion: nil)
			return
		}
		let newPoint = POI(location: location, country: country, clues: getClues())
		
		delegate?.addedNew(point: newPoint)
	}
	
	@IBAction func cancelAction(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
	private func getClues() -> [String] {
		var clues = [String]()
		for clueTextField in cluesTextFieldCollection {
			if let clue = clueTextField.optionalText {
				clues.append(clue)
			}
		}
		return clues
	}
}

extension UITextField {
	var optionalText: String? {
		let trimmedText = self.text?.trimmingCharacters(in: .whitespacesAndNewlines)
		return (trimmedText ?? "").isEmpty ? nil : trimmedText
	}
}

extension AddPOI_VC: UITextFieldDelegate {
	private func configTextFields() {
		locationTextField.delegate = self
		countryTextField.delegate = self
		
		cluesTextFieldCollection = cluesTextFieldCollection.sorted{$0.tag < $1.tag}
		for field in cluesTextFieldCollection {
			field.delegate = self
		}
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if let _ = textField.optionalText {
			switch textField {
			case locationTextField: countryTextField.becomeFirstResponder()
			case countryTextField: cluesTextFieldCollection[0].becomeFirstResponder()
			case cluesTextFieldCollection[0]: cluesTextFieldCollection[1].becomeFirstResponder()
			case cluesTextFieldCollection[1]: cluesTextFieldCollection[2].becomeFirstResponder()
			default: textField.resignFirstResponder()
			}
		}
		return false
	}
}
