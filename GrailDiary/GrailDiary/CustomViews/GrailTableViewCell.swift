//
//  GrailTableViewCell.swift
//  GrailDiary
//
//  Created by Alex Rhodes on 8/12/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import UIKit

class GrailTableViewCell: UITableViewCell {
    
    var grailController: GrailController?
    
    @IBOutlet weak var cityStateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var numberOfCluesLabel: UILabel!
    
    
    var grail: Grail? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let clue = grail?.clue.count else {return}
        cityStateLabel.text = grail?.cityOrState
        countryLabel.text = grail?.country
        
        if grail?.clue.count == 1 {
            numberOfCluesLabel.text = String("\(clue) clue")
        } else {
            numberOfCluesLabel.text = String("\(clue) clues")
        }
    }
    
}
