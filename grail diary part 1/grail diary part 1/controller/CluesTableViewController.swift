//
//  ViewController.swift
//  grail diary part 1
//
//  Created by brian vilchez on 8/13/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class CluesTableViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var POIS: [POI] = []
    override func viewDidLoad() {
        super.viewDidLoad()
      tableview.dataSource = self
    }


}

extension CluesTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POIS.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else {return UITableViewCell()}
        let poi = POIS[indexPath.row]
        cell.poi = poi
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            guard let AddPOiVC = segue.destination as? AddPOIViewController else {return}
            AddPOiVC.POIDelegate = self
            
        } else if segue.identifier == "ShowPOIDetailSegue" {
            guard let selectedIndexPath = tableview.indexPathForSelectedRow,
                let POiDetailVC = segue.destination as? POIDetailViewController else {return}
                let poi = POIS[selectedIndexPath.row]
                POiDetailVC.poi = poi
        }
    }
    
}

extension CluesTableViewController: CreatePOI {
    func createPOI(poi: POI) {
        POIS.append(poi)
        dismiss(animated: true, completion: nil)
        tableview.reloadData()
    }
}
