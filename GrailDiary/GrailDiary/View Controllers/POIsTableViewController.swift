//
//  ViewController.swift
//  GrailDiary
//
//  Created by Ian French on 4/12/20.
//  Copyright © 2020 Ian French. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

@IBOutlet weak var tableView: UITableView!
    
    var points: [POI] = [
        POI(location: "Banff", country: "Canada", clues: ["Mountains", "Fairmont Hotel", "Cascade Mountain"])
       ]
    
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "AddPOIModalSegue" {
            if let addVC = segue.destination as? AddPOIViewController {
                addVC.delegate = self 
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let detailVC = segue.destination as? POIDetailViewController ,
                let indexPath = tableView.indexPathForSelectedRow {
                let point = points[indexPath.row]
            
            
        
                detailVC.poi = point
            }
        
        }
        
        
    }
}  // class end bracket


extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return points.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
           
           let poi = points[indexPath.row]
           cell.poi = poi
           return cell
    
    
    
    }
}
    
extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(poi: POI) {
        points.append(poi)
        tableView.reloadData()
          }
       }
 





