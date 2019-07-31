//
//  POIsViewController.swift
//  Grail Diary
//
//  Created by Thomas Dye on 07/29/2019.
//  Copyright © 2019 Thomas Dye. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    var pointOfInterestArray: [POI] = []
    
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let selectedIndexPath = tableView.indexPathForSelectedRow,
                let poiDetailVC = segue.destination as? POIDetailViewController { poiDetailVC.poi = pointOfInterestArray[selectedIndexPath.row]
            }
        }
    }
}
// MARK: - Extensions
extension POIsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pointOfInterestArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ClueCell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        let poi = pointOfInterestArray[indexPath.row]
        cell.poi = poi
        
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        pointOfInterestArray.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
