//
//  GrailDetailViewController.swift
//  GrailDiary
//
//  Created by Alex Rhodes on 8/12/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import UIKit

class GrailDetailViewController: UIViewController {
    
    var grailController: GrailController?
    
    var grail: Grail?

    @IBOutlet weak var grailImageView: UIImageView!
    @IBOutlet weak var cityStateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    func setViews() {
        
        guard let city = grail?.cityOrState, let country = grail?.country, let grail = grail else {return}
        cityStateLabel.text = "\(city), \(country)"
        cityStateLabel.font = UIFont(name: "System Bold", size: 12)
        
        grailImageView.image = grail.image
        
        var clueString = ""
        let clues = grail.clue
        
        for clue in clues {
            clueString.append(clue)
            clueString.append("\n")
        }
        cluesTextView.text = clueString
        
        cluesLabel.text = "CLUES"
        cluesLabel.font = UIFont(name: "System Heavy", size: 30)
    }
}
