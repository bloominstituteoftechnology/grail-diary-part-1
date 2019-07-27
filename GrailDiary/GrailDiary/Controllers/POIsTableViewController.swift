//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by John Kouris on 7/24/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var pointsOfInterest = [POI]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let destinationVC = segue.destination as? AddPOIViewController {
                destinationVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
                let destinationVC = segue.destination as? POIDetailViewController {
                destinationVC.poi = pointsOfInterest[indexPath.row]
            }
        }
    }
}

extension POIsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pointsOfInterest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        cell.poi = pointsOfInterest[indexPath.row]
        
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
