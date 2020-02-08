//
//  POIsTableViewController.swift
//  GrailDairy
//
//  Created by sierra on 11/18/19.
//  Copyright © 2019 sierra. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var POIAreas: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let AddPOIVC = segue.destination as? AddPOIViewController {
                AddPOIVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let IndexPath = tableView.indexPathForSelectedRow,
            let POIDetailVC = segue.destination as? POIDetailViewController {
                POIDetailVC.poi = POIAreas[IndexPath.row]
            }
        }
    }
    
   }

// Table view data

    extension POIsTableViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return POIAreas.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
            let poi = POIAreas[indexPath.row]
            cell.poi = poi
            return cell
    }
}


extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        POIAreas.append(poi)
        tableView.reloadData()
    }
    }


