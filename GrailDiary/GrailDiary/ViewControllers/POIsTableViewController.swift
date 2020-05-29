//
//  ViewController.swift
//  GrailDiary
//
//  Created by James Sedlacek on 5/22/20.
//  Copyright © 2020 James Sedlacek. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var poi: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNewPOI" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetail" {
            if let indexPath = tableView.indexPathForSelectedRow,
                let poiDetailVC = segue.destination as? POIDetailViewController {
                poiDetailVC.poi = poi[indexPath.row]
            }
        }
    }

}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath)
            as? POITableViewCell else { return UITableViewCell() }
        /*
        cell.locationLabel.text = poi[indexPath.row].location
        cell.countryLabel.text = poi[indexPath.row].country
        cell.cluesCountLabel.text = "\(poi[indexPath.row].clues.count)"
         */
        
        cell.poi = poi[indexPath.row]
        
        return cell
    }
}

extension POIsTableViewController: addPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        self.poi.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}

