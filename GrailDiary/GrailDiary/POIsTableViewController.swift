//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Bronson Mullens on 4/10/20.
//  Copyright © 2020 Bronson Mullens. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    var allPOIs: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let hpVC = segue.destination as? AddPOIViewController {
                hpVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let hpVC = segue.destination as? POIDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                hpVC.poi = allPOIs[indexPath.row]
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!

}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPOIs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        let newPOI = allPOIs[indexPath.row]
        cell.poi = newPOI
        return cell
    }
    
    
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        allPOIs.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
}
