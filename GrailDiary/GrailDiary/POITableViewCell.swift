//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by beth on 1/23/20.
//  Copyright © 2020 elizabeth wingate. All rights reserved.
//
import UIKit

class POITableViewCell: UITableViewCell {

    
    var _: POI? {
        didSet{
            updateViews()
        }
    }

}
