//
//  POIsTableViewController.swift
//  ios-8-grail-diary
//
//  Created by Alex Shillingford on 7/16/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var poiTableView: UITableView!
    var poiList : [POI] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        poiTableView.dataSource = self
    }
    
}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poiList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        let poi = poiList[indexPath.row]
        cell.poi = poi
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            guard let addPOIVC = segue.destination as? AddPOIViewController else { return }
            
            addPOIVC.delegate = self
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let poiDetailVC = segue.destination as? POIDetailViewController,
                let indexPath = poiTableView.indexPathForSelectedRow {
                poiDetailVC.poi = poiList[indexPath.row]
            }
        }
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        poiList.append(poi)
        dismiss(animated: true, completion: nil)
        poiTableView.reloadData()
    }
    
    
}
