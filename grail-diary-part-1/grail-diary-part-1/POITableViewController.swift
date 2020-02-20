//
//  POITableViewController.swift
//  grail-diary-part-1
//
//  Created by Samuel Esserman on 2/18/20.
//  Copyright © 2020 Samuel Esserman. All rights reserved.
//


import UIKit

class POITableViewController: UIViewController {
   @IBOutlet weak var tableView: UITableView!
    
    var pois: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let selectedRow = tableView.indexPathForSelectedRow,
                let detailVC = segue.destination as? POIDetailViewController {
                detailVC.poi = pois[selectedRow.row]
            }
        }
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
    
    
    
    
        // Do any additional setup after loading the view.
       
}
extension POITableViewController: UITableViewDataSource, UITableViewDelegate {
    
}
extension POITableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        tableView.reloadData()
    }
}


