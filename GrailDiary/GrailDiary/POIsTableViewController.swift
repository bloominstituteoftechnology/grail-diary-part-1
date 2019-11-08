//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Donella Barcelo on 11/7/19.
//  Copyright © 2019 Donella Barcelo. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDataSource, AddPOIDelegate {
 
    var pois: [POI] = [
        POI(location: "Hilo, Hawaii", country: "United States", clues: ["1", "2", "3"])
    ]
    
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
     }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else {
            return UITableViewCell()
        }
        
        let poi = pois[indexPath.row]
        
        cell.poi = poi
        
        return cell
        
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
            }
                } else if segue.identifier == "ShowPOIDetailSegue" {
                if let poiDetailVC = segue.destination as? POIDetailViewController,
                    let indexPath = tableView.indexPathForSelectedRow {
                    
                    let poi = pois[indexPath.row]
                    poiDetailVC.poi = poi
            }
        }
    }
}
