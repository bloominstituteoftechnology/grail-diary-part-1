//
//  POIsTableViewController.swift
//  GrailDairy
//
//  Created by Jeremy Taylor on 11/16/19.
//  Copyright © 2019 Bytes-Random L.L.C. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var pois: [POI] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            guard let destinationVC = segue.destination as? AddPOIViewController else { return }
            
            destinationVC.delegate = self
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
                let destinationVC = segue.destination as? POIDetailViewController {
                destinationVC.poi = pois[indexPath.row]
            }
        }
    }

}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { fatalError() }
        
        let poi = pois[indexPath.row]
        
        cell.poi = poi
        
        return cell
        
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}


