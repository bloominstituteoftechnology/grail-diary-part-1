//
//  ViewController.swift
//  GrailDiary
//
//  Created by Mike Nichols on 5/12/20.
//  Copyright © 2020 Mike Nichols. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
  
    // #7
    
    //  var poiArray = poiList (declared global poiList in POI.swift)
    
    // #8
    
    @IBOutlet weak var tableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poiList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else {
            fatalError("Cell identified is wrong or the cell is not of expected type POITableViewCell")
        }
        
        let poi = poiList[indexPath.row]
        
        cell.locationLabel.text = poi.location
        cell.countryLabel.text = poi.country
        cell.cluesNumberLabel.text = String(poi.clues.count)
        
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        poiList.append(poi)
        
    }
}

