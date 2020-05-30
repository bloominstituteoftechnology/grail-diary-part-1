//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Cora on 5/21/20.
//  Copyright © 2020 Cora. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    var POIs: [POI] = [POI(location: "Sedona, Arizona", country: "USA", clues: ["Beautiful", "Great Rocks", "Inspiring"]), POI(location: "Alameda, California", country: "USA", clues: ["Hometown"])]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
            }
        }
        else if segue.identifier == "showPOIDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
                let poiDetailVC = segue.destination as? POIDetailViewController {
                poiDetailVC.poi = POIs[indexPath.row]
            }
        }
    }
}

extension POIsTableViewController: UITableViewDelegate {
}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POIs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell()}
        cell.poi = POIs[indexPath.row]
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
