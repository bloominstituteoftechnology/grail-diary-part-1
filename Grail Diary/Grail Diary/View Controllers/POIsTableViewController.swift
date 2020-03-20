//
//  ViewController.swift
//  Grail Diary
//
//  Created by Harmony Radley on 3/17/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var pois = [POI]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "AddPOIModalSegue" {
                    if let addPOIVC = segue.destination as? AddPOIViewController {
                        addPOIVC.delegate = self
                        
                    }
                } else if segue.identifier == "ShowPOIDetailSegue" {
                    if let indexPath = tableView.indexPathForSelectedRow,
                        let poiDetailVC = segue.destination as? POIDetailViewController {
                        poiDetailVC.poi = pois[indexPath.row]
                }
            }
    }
}

// Outside of class

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell =
            tableView.dequeueReusableCell(withIdentifier:
            "POICell", for: indexPath) as?
            POITableViewCell else {
                fatalError("Cell is not a POITableViewCell")
        }
        
        let poi = pois[indexPath.row]
        
        cell.poi = poi
        
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        tableView.reloadData()
    }
}
