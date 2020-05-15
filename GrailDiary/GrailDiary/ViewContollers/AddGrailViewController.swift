//
//  AddGrailViewController.swift
//  GrailDiary
//
//  Created by Alex Rhodes on 8/12/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import UIKit

class AddGrailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var grailController: GrailController?
    
    var tableView: UITableView?
    
    @IBOutlet weak var addGrailLabel: UILabel!
    @IBOutlet weak var cityStateTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var cluesLabel: UILabel!
    @IBOutlet weak var clueOneTextField: UITextField!
    @IBOutlet weak var clueTwoTextField: UITextField!
    @IBOutlet weak var clueThreeTextField: UITextField!
    @IBOutlet weak var grailImageView: UIImageView!
    @IBOutlet weak var addPhotoButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    func setViews() {
        addGrailLabel.text = "DESTINATION NAME:"
        addGrailLabel.textColor = .black
        addGrailLabel.font = UIFont(name: "System Heavy", size: 30)
        
        cluesLabel.text = "DESTINATION CLUES:"
        cluesLabel.font = UIFont(name: "System Heavy", size: 30)
        
        grailImageView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        addPhotoButton.setTitle("UPLOAD PHOTO", for: .normal)
        addPhotoButton.titleLabel?.font = UIFont(name: "System Heavy", size: 17)
        addPhotoButton.setTitleColor(.white, for: .normal)
        addPhotoButton.tintColor = .lightGray
        addPhotoButton.backgroundColor = .black
        addPhotoButton.layer.cornerRadius = 10
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let city = cityStateTextField.text,
            let country = countryTextField.text,
            let clue1 = clueOneTextField.text,
            let clue2 = clueTwoTextField.text,
            let clue3 = clueThreeTextField.text,
            let image = grailImageView.image else {return}
        
        grailController?.addGrail(city: city, country: country, clues: [clue1, clue2, clue3], image: image)
        
        tableView?.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addPhotoButtonPressed(_ sender: UIButton) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Please select your photo source.", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            } else {
                let alert =  UIAlertController(title: "Camera Unavailable", message: "We were unable to gain access to your camera.", preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
                
            }
            
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil ))
        
        present(actionSheet, animated: true, completion: nil)
        
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        grailImageView.image = selectedImage
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

