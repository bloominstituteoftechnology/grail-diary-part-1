//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by David Williams on 1/30/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var pois: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        let poi = pois[indexPath.row]
        cell.poi = poi
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            pois.remove(at: indexPath.row)
        }
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModal" {
            guard let addPoiVC = segue.destination as? AddPOIViewController else { return }
            addPoiVC.delegate = self
        }
        if segue.identifier == "ShowPOIDetail" {
            guard let showPoiVC = segue.destination as? POIDetailViewController, let indexPath = tableView.indexPathForSelectedRow else { return }
            let poi = pois[indexPath.row]
            showPoiVC.poi = poi
        }
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        tableView.reloadData()
    }
}
