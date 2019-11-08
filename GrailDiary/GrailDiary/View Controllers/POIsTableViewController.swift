//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Donella Barcelo on 11/7/19.
//  Copyright © 2019 Donella Barcelo. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, AddPOIDelegate {
 
    var pois: [POI] = [
        POI(location: "Hilo, HI", country: "United States", clues: ["1", "2", "3"])
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    struct Segues {
        static let addPOIModalSegue = "AddPOIModalSegue"
        static let showPOIDetailSegue = "ShowPOIDetailSegue"
        static let POICell = "POICell"
    }
    
    func poiWasAdded(_ poi: POI) {
            pois.append(poi)
            tableView.reloadData()
            dismiss(animated: true, completion: nil)
        }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
               
            if segue.identifier == Segues.addPOIModalSegue {
                   if let addPOIVC = segue.destination as? AddPOIViewController {
                       addPOIVC.delegate = self
                   }
            } else if segue.identifier == Segues.showPOIDetailSegue {
                       if let poiDetailVC = segue.destination as? POIDetailViewController,
                           let indexPath = tableView.indexPathForSelectedRow {
                        poiDetailVC.poi = pois[indexPath.row]
            }
        }
    }
}
    
    extension POIsTableViewController: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return pois.count
          }
          
          func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Segues.POICell, for: indexPath) as? POITableViewCell else { return UITableViewCell() }
              let poi = pois[indexPath.row]
              cell.poi = poi
              return cell
    }
}
