//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Ian Becker on 5/14/20.
//  Copyright © 2020 Ian Becker. All rights reserved.
//

import UIKit

class POIsTableViewController: UITableViewController {
    
    var pois: [POI] = [POI(location: "The Gorge Ampitheater", country: "USA", clues: ["Festivals", "Concerts", "Camping"])]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return  UITableViewCell()}
        
        return cell
    }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "POIDetailViewSegue" {
            guard let newPOIVC = segue.destination as? POIDetailViewController, let indexPath = tableView.indexPathForSelectedRow else { return }
            let poi = pois.self[indexPath.row]
            newPOIVC.poi = poi
            
        } else if segue.identifier == "AddPOIModalSegue" {
            guard let newPOIVC = segue.destination as? AddPOIViewController else { return }
            newPOIVC.delegate = self
            }
    }
}

extension POIsTableViewController: AddPOIDelegate {
func poiWasAdded(_ poi: POI) {
    pois.append(poi)
    dismiss(animated: true, completion: nil)
    tableView.reloadData()
    }
}
