//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Chris Gonzales on 1/23/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    
    @IBOutlet weak var NumberOfCluesLabel: UILabel!
    @IBOutlet weak var LocationLabel: UILabel!
    @IBOutlet weak var CountryLabel: UILabel!
    
    var poi: POI?{
        didSet{
            updateViews()
        }
    }

    func updateViews(){
        guard let unwrappedPOI = poi else {return}
        NumberOfCluesLabel.text = unwrappedPOI.clues.joined(separator: "\n")
        LocationLabel.text = unwrappedPOI.location
        CountryLabel.text = unwrappedPOI.country
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

