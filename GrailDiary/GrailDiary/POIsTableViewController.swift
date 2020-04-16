//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Clayton Watkins on 4/15/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    var pois: [POI] = []

    @IBOutlet weak var POITableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue"{
            if let AddVC = segue.destination as? AddPOIViewController{
                AddVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue"{
            if let detailVC = segue.destination as? POIDetailViewController,
                let indexPath = POITableView.indexPathForSelectedRow{
                let poi = pois[indexPath.row]
                detailVC.poi = poi
            }
        }
    }
}

extension POIsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell
        else { return UITableViewCell() }
        
        let poi = pois[indexPath.row]
        cell.poi = poi
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate{
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        POITableView.reloadData()
    }
}
