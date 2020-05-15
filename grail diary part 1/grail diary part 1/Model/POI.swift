//
//  POI.swift
//  grail diary part 1
//
//  Created by brian vilchez on 8/14/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import Foundation
protocol CreatePOI  {
    func createPOI(poi: POI)
}


/// data model
struct POI {
   
    let location: String
    let country:String
    var clues:[String]
    
    init(location:String, country:String) {
        self.location = location
        self.country = country
        clues = []
    }
 
}



