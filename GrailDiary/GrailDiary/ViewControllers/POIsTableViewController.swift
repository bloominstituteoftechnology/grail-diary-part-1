//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Shawn Gee on 2/6/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    var pois = [POI]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            guard let addPOIViewController = segue.destination as? AddPOIViewController else { return }
            addPOIViewController.delegate = self
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let selectedIndexPath = tableView.indexPathForSelectedRow,
               let poiDetailViewController = segue.destination as? POIDetailViewController {
                poiDetailViewController.poi = pois[selectedIndexPath.row]
            }
        }
    }
}

//MARK: - UITableViewDataSource

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath)
        if let poiCell = cell as? POITableViewCell {
            poiCell.poi = pois[indexPath.row]
        }
        return cell
    }
}

//MARK: - ADDPOIDelegate

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        tableView.reloadData()
    }
}
