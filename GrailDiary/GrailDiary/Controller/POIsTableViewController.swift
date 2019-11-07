//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Chad Rutherford on 11/5/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    var points = [POI]()
    let point = POI(location: "Venice", country: "Italy", clues: ["1", "2", "3"])
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        points.append(point)
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case Segues.showPOIDetailSegue:
            print("Show POI Detail")
        case Segues.addPOIModalSegue:
            guard let addPOIVC = segue.destination as? AddPOIViewController else { return }
            addPOIVC.delegate = self
        default:
            break
        }
    }
}

// --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
// MARK: - TableView Delegate and DataSource Extension
extension POIsTableViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return points.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.poiCell, for: indexPath)
        return cell
    }
}

// --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
// MARK: - AddPOIDelegate Extension
extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        points.append(poi)
        tableView.reloadData()
    }
}
