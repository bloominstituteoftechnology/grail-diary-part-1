//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Joshua Rutkowski on 11/21/19.
//  Copyright © 2019 Joshua Rutkowski. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    struct PropertyKeys {
        static let addPOIModalSegue = "AddPOIModalSegue"
        static let showPOIDetailSegue = "ShowPOIDetailSegue"
        static let POICell = "POICell"
    }
    
    var POIs: [POI] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.dataSource = self
    }
    
    // MARK: - navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == PropertyKeys.addPOIModalSegue {
            if let poiVC = segue.destination as? AddPOIViewController {
                poiVC.delegate = self
            }
        } else if segue.identifier == PropertyKeys.showPOIDetailSegue {
            if let poiDetailVC = segue.destination as? POIDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow {
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.POICell, for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        let poi = POIs[indexPath.row]
        cell.poi = poi
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        POIs.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
