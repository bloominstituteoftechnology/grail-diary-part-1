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
	@IBOutlet var hobbiesTextFieldCollection: [UITextField]!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configTextFields()
	}
	
	@IBAction func saveAction(_ sender: Any) {
		
	}
	
	@IBAction func cancelAction(_ sender: Any) {
		dismiss(animated: true, completion: nil)
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
		
		hobbiesTextFieldCollection = hobbiesTextFieldCollection.sorted{$0.tag < $1.tag}
		for field in hobbiesTextFieldCollection {
			field.delegate = self
		}
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if let _ = textField.optionalText {
			switch textField {
			case locationTextField: countryTextField.becomeFirstResponder()
			case countryTextField: hobbiesTextFieldCollection[0].becomeFirstResponder()
			case hobbiesTextFieldCollection[0]: hobbiesTextFieldCollection[1].becomeFirstResponder()
			case hobbiesTextFieldCollection[1]: hobbiesTextFieldCollection[2].becomeFirstResponder()
			default: textField.resignFirstResponder()
			}
		}
		return false
	}
}
