//
//  ViewController.swift
//  GrailDiary
//
//  Created by Mike Nichols on 5/12/20.
//  Copyright © 2020 Mike Nichols. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
  
    
    // #8
    
    @IBOutlet weak var tableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // #27 28
    
    override func prepare(for segue: AddPOIModalSegue, sender: Any?) {
        
        if
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

// #22

extension POIsTableViewController: AddPOIDelegate {
    
    // #23
    
    func poiWasAdded(_ poi: POI) {
        
        // #24
        poiList.append(poi)
        
        // #25
        
        dismiss(animated: true, completion: nil)
        
        // #26
        
        tableView.reloadData()
        
    }

}


