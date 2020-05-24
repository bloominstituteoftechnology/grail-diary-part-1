//
//  ViewController.swift
//  GrailDiary
//
//  Created by John McCants on 5/19/20.
//  Copyright © 2020 John McCants. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDataSource {
    
    var poiArray : [POI] = [POI(location: "Bahamas", country: "Brazil", clues: ["Its surrounded by water", "Its cool to go on a vacaction here"])]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.poiArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as! POITableViewCell
        
        
        cell.countryLabel.text = self.poiArray[indexPath.row].country
        cell.locationLabel.text = self.poiArray[indexPath.row].location
        cell.cluesLabel.text = "\(self.poiArray[indexPath.row].clues.count) clues"

        
               
           
               return cell
    }

}

