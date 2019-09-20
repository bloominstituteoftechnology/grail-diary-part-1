//
//  POIsTableViewController.swift
//  Grail Project
//
//  Created by Blake Andrew Price on 7/17/19.
//  Copyright © 2019 Blake Andrew Price. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var poiModels: [POI] = []
}


extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poiModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return  UITableViewCell() }
        
        let poi = poiModels[indexPath.row]
        cell.poi = poi
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
                let poiDetailVC = segue.destination as? POIDetailViewController {
                poiDetailVC.poi = poiModels[indexPath.row]
            }
        }
    }
}

extension POIsTableViewController: AddPOIDelegate {
        
        func poiWasCreated(_ poi: POI) {
            poiModels.append(poi)
            dismiss(animated: true, completion: nil)
            tableView.reloadData()
        }
    }

