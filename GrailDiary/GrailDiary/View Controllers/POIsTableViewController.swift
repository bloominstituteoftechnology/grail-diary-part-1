//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Alex Rhodes on 7/17/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDataSource {
    
    var pois: [POI] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell
            else { return UITableViewCell()}
        
        let POI = pois[indexPath.row]
        cell.POI = POI
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModelSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
            }
        } else {
            if segue.identifier == "ShowPOIDetailSegue" {
                if let indexPath = tableView.indexPathForSelectedRow,
                    let poiDetailVC = segue.destination as? POIDetailViewController {
                    poiDetailVC.poi = pois[indexPath.row]
                }
            }
        }
    }
    
    
}

extension POIsTableViewController: addPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
        
    }
    
    
}
