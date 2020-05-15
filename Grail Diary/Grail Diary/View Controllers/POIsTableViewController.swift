//
//  POIsTableViewController.swift
//  Grail Diary
//
//  Created by Joel Groomer on 7/30/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var pointsOfInterest: [POI] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let vc = segue.destination as? AddPOIViewController {
                vc.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
               let vc = segue.destination as? POIDetailViewController {
                vc.poi = pointsOfInterest[indexPath.row]
            }
        }
    }
}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pointsOfInterest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell
            else { return UITableViewCell() }
        
        let poi = pointsOfInterest[indexPath.row]
        cell.poi = poi
        
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        pointsOfInterest.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
