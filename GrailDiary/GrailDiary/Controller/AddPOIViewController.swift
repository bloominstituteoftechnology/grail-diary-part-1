//
//  POIsViewController.swift
//  GrailDiary
//
//  Created by Lambda_School_loaner_226 on 12/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol AddPOIDelegate
{
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController
{
    
    var delegate: AddPOIDelegate?

    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clueOneTextField: UITextField!
    @IBOutlet weak var clueTwoTextField: UITextField!
    @IBOutlet weak var clueThreeTextField: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        locationTextField.delegate = self
        countryTextField.delegate = self
        clueOneTextField.delegate = self
        clueTwoTextField.delegate = self
        clueThreeTextField.delegate = self
        

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
    
    
    
    @IBAction func cancelButtontapped(_ sender: UIBarButtonItem)
    {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem)
    {
        
        guard let locationText = locationTextField.text,
        let countryText = countryTextField.text
        else {return}
        
        var newPOI = POI(location: locationText, country: countryText, clues: [])
        
        if let clueOneText = clueOneTextField.text
        {
            newPOI.clues.append(clueOneText)
        }
        if let clueTwoText = clueTwoTextField.text
        {
            newPOI.clues.append(clueTwoText)
        }
        if let clueThreeText = clueThreeTextField.text
        {
            newPOI.clues.append(clueThreeText)
        }
        
        delegate?.poiWasAdded(newPOI)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if let newText = textField.text
        {
            
            if !newText.isEmpty
            {
                textField.resignFirstResponder()
                switch textField {
                case locationTextField:
                    countryTextField.becomeFirstResponder()
                case countryTextField:
                    clueOneTextField.becomeFirstResponder()
                case clueOneTextField:
                    clueTwoTextField.becomeFirstResponder()
                case clueTwoTextField:
                    clueThreeTextField.becomeFirstResponder()
                case clueThreeTextField:
                    clueThreeTextField.resignFirstResponder()
                default:
                    break
                }
            }
        }
        return true
    }
}

extension AddPOIViewController: UITextFieldDelegate
{
    
}
