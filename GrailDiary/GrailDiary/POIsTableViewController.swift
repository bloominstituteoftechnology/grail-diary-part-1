//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Patrick Millet on 11/7/19.
//  Copyright © 2019 Patrick Millet. All rights reserved.
//

import UIKit


class POIsTableViewController: UIViewController, AddPOIDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    var POIs: [POI] = []
    
    func poiWasAdded(poi: POI) {
        POIs.append(poi)
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
      if segue.identifier == "AddPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
            addPOIVC.delegate = self
        }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
            let poiDetailVC = segue.destination as? POIDetailViewController {
            poiDetailVC.poi = POIs[indexPath.row]

            }
        }
    }
}


extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POIs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        let POI = POIs[indexPath.row]
        
        cell.poi = POI
        
        return cell
    }
}
