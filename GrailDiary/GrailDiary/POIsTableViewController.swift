//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Josh Kocsis on 4/10/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var poiArray: [POI] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addVC = segue.destination as? AddPOIViewController {
                addVC.delegate = self
            }
        } else if segue.identifier ==  "ShowPOIDetailSegue" {
            if let detailVC = segue.destination as? POIDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                let poi = poiArray[indexPath.row]
                detailVC.poi = poi
            }
        }
    }
}

extension POIsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poiArray.count
       }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return POITableViewCell() }
        
        let newPOIArray = poiArray[indexPath.row]
        cell.poiArray = newPOIArray
        
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        poiArray.append(poi)
        tableView.reloadData()
    }
}

