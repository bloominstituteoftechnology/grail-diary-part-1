//
//  ViewController.swift
//  Diary
//
//  Created by Lydia Zhang on 2/18/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddPOIDelegate {
    

    var pois:[POI] = [POI(location: "Shanghai", country: "China", clue: ["clue1","clue2","clue3"])]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else {
            return UITableViewCell()
        }
        let poi = pois[indexPath.row]
        cell.poi = poi
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            guard let newPoiVC = segue.destination as? AddPOIViewController else {
                return
            }
            newPoiVC.delegate = self
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                guard let detailPoiVC = segue.destination as? POIDetailViewController else {
                    return
                }
                detailPoiVC.poi = pois[indexPath.row]
            }
        }
    }
}

