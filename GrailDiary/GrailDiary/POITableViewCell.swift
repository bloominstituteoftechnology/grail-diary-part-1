//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Mark Poggi on 3/19/20.
//  Copyright © 2020 Mark Poggi. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet weak var locationTextField: UILabel!
    @IBOutlet weak var countryTextField: UILabel!
    @IBOutlet weak var cluesTextField: UILabel!
 
    var poi: POI?{didSet{updateViews()}}
    
    private func updateViews() {
        guard let newPOI = poi else { return }
        locationTextField.text = newPOI.location
        countryTextField.text  = newPOI.country
        cluesTextField.text = "\(newPOI.clues.count) of clues."
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
