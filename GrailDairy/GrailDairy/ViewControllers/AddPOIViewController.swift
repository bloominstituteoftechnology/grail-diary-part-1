//
//  AddPOIViewController.swift
//  GrailDairy
//
//  Created by alfredo on 11/24/19.
//  Copyright © 2019 alfredo. All rights reserved.
//

import UIKit

//13. Declare a protocol above this class in the same file called `AddPOIDelegate`; declare a single function requirement called `poiWasAdded(_ poi: POI)`
protocol AddPOIDelegate{
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    //MARK: -IBOutlets
    //12. Declare `IBOutlet` properties for the 5 textfields
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    var delegate: AddPOIDelegate?   //14. Declare a variable property called `delegate` of type `AddPOIDelegate` and make it optional
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
    //15. Create 2 `IBAction` methods: `cancelTapped(_ sender: UIBarButtonItem)`, and `saveTapped(_ sender: UIBarButtonItem)`; wire them up to their appropriate bar button items in the storyboard
    @IBAction func cancelTapped(_ sender: Any) {
       // 16. Inside `cancelTapped`, simply dismiss this view as the user has indicated they want to leave this screen
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        //17. Inside `saveTapped`, guard unwrap the text inside the location and country textfields, initialize a `POI` object, and then if-let unwrap the 3 clue textfields and add them to the POI if applicable
        guard let location = locationTextField.text,
            let country = countryTextField.text,
            !location.isEmpty,
            !country.isEmpty else { return }
        var poi = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1TextField.text, !clue1.isEmpty {
            poi.clues.append(clue1)
        }
        if let clue2 = clue2TextField.text, !clue2.isEmpty {
            poi.clues.append(clue2)
        }
        if let clue3 = clue3TextField.text, !clue3.isEmpty {
            poi.clues.append(clue3)
        }
        delegate?.poiWasAdded(poi)//18. At the end of the `saveTapped` method, call the delegate method on the delegate property and pass the POI that was just created as an argument
    }
}
//19. In an extension, make the class conform to the `UITextFieldDelegate` protocol
extension AddPOIViewController: UITextFieldDelegate{
    // 21. Implement the delegate method `textFieldShouldReturn(_:)`; unwrap the text and make sure it's not empty, then `switch` off the textfield to determine which one called this method; change the `firstResponder` status to the appropriate textfield
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            switch textField {
            case locationTextField:
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

