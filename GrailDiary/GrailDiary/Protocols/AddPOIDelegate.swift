//
//  AddPOIDelegate.swift
//  GrailDiary
//
//  Created by Chad Rutherford on 11/7/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import Foundation

/// Delegate utilized to enable the easy passing of data from one ViewController to the next.
protocol AddPOIDelegate: AnyObject {
    func poiWasAdded(_ poi: POI)
}
