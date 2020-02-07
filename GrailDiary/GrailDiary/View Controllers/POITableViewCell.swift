//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Chad Parker on 2/6/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    var poi: POI? {
        didSet {
            self.updateViews()
        }
    }

    private func updateViews() {
        guard let poi = poi else { return }

        // TODO: update UI
    }
}
