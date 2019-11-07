//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Chad Rutherford on 11/7/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Outlets
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesLabel: UILabel!
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    /// Observed property utilized to configure the layout and display of information in each TableViewCell
    var point: POI? {
        didSet {
            updateViews()
        }
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Configuration Helper
    /// Function used to configure the cell for display by the table view
    private func updateViews() {
        guard let point = point else { return }
        locationLabel.text = point.location
        countryLabel.text = point.country
        cluesLabel.text = "\(point.clues.count) clues"
    }
}
