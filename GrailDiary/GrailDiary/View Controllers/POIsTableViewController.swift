//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Rob Vance on 4/9/20.
//  Copyright © 2020 Robs Creations. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var pois: [POI] = []
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addVC = segue.destination as? AddPOIViewController {
                addVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let detailVC = segue.destination as? POIDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                let poi = pois[indexPath.row]
                detailVC.poi = poi
            }
        }
    }

   
}
extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        let poi = pois[indexPath.row]
        cell.poi = poi
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func newPOIAdded(poi: POI) {
        pois.append(poi)
        tableView.reloadData()
    }
    
   
   }
