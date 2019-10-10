//
//  ViewController.swift
//  GrailDiary
//
//  Created by Jon Bash on 2019-10-08.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    var pois: [POI] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            guard let addPOIVC = segue.destination as? AddPOIViewController
                else { return }
            addPOIVC.delegate = self
            
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let poiDetailVC = segue.destination as? POIDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow
            {
                poiDetailVC.poi = pois[indexPath.row]
                poiDetailVC.delegate = self
            }
        }
    }
}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
            tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath)
                as? POITableViewCell
            else { return UITableViewCell() }
        
        cell.poi = pois[indexPath.row]
        
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}

extension POIsTableViewController: POIDetailDelegate {
    func detailViewWasDismissed() {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
