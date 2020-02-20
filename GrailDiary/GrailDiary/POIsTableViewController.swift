//
//  ViewController.swift
//  GrailDiary
//
//  Created by Wyatt Harrell on 2/18/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var pois: [POI] = [POI(location: "test", country: "test", clues: ["test", "test", "test"])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddPOIModalSegue" {
            guard let AddPOIVC = segue.destination as? AddPOIViewController else { return }
            
            AddPOIVC.delegate = self
            
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let POIDetailVC = segue.destination as? POIDetailViewController, let selectedRow = tableView.indexPathForSelectedRow {
                POIDetailVC.poi = pois[selectedRow.row]
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        let aPOI = pois[indexPath.row]
        cell.poi = aPOI
        
        return cell
    }

}



extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        tableView.reloadData()
    }
}
