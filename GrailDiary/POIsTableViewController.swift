//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Shawn James on 3/17/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var POIs: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            // Get the new view controller using segue.destination.
            guard let addPOIViewController = segue.destination as? AddPOIViewController else { return }
            // Pass the selected object to the new view controller.
            addPOIViewController.delegate = self
        } else if segue.identifier == "ShowPOIDetailSegue" {
            // Get the new view controller using segue.destination.
            guard let pOIDetailViewController = segue.destination as? POIDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            // Pass the selected object to the new view controller.
            pOIDetailViewController.poi = POIs[indexPath.row]
        }
    }
    
}

// MARK: - Table View Data Source
extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        POIs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { fatalError("Failed To Dequeue Reusable Cell") }
        cell.poi = POIs[indexPath.row]
        return cell
    }
    
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        POIs.append(poi)
        tableView.reloadData()
    }
    
}
